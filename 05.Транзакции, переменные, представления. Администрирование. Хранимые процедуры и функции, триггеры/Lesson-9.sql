#Транзакции, переменные, представления

-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.


USE sample; 

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;




-- Создайте представление, которое выводит название name товарной позиции из таблицы products 
-- и соответствующее название каталога name из таблицы catalogs.

USE shop;

DROP VIEW IF EXISTS new_catalog;

CREATE VIEW new_catalog (product_name, catalog_name) AS
SELECT p.name, c.name FROM products p
JOIN catalogs c ON c.id = p.catalog_id;

	
SELECT * FROM new_catalog ORDER BY catalog_name;


-- (по желанию) Пусть имеется таблица с календарным полем created_at. 
-- В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', 
-- '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
-- выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.


DROP TABLE IF EXISTS date_tbl;

CREATE TABLE date_tbl (
id SERIAL PRIMARY KEY,
name VARCHAR(225),
created_at DATE NOT NULL
);

INSERT INTO date_tbl (id, name, created_at) 
VALUES 
(NULL, 'some text', '2018-08-01'), 
(NULL, 'some2 text', '2018-08-04'), 
(NULL, 'fsome text', '2018-08-16'), 
(NULL, 'fisome text', '2018-08-17'), 
(NULL, 'firsome text', '2018-08-21'), 
(NULL, 'firstsome text', '2018-08-24');


CREATE TEMPORARY TABLE month_days (
	days INT
);


INSERT INTO month_days VALUES
(0), (1), (2), (3), (4), (5), (6), (7),
(8), (9), (10), (11), (12), (13), (14),
(15), (16), (17), (18), (19), (20), (21), 
(22), (23), (24), (25), (26), (27), (28),
(29), (30);

SELECT 
	DATE(DATE('2018-08-31') - INTERVAL m.days DAY) AS day
FROM month_days m
ORDER BY day;

SELECT * FROM date_tbl;


SELECT 
	DATE(DATE('2018-08-31') - INTERVAL m.days DAY) AS DAY,
	NOT ISNULL(dt.name) AS order_exist
FROM month_days m
LEFT JOIN
	date_tbl AS dt
ON 
	DATE(DATE('2018-08-31') - INTERVAL m.days DAY) = dt.created_at
ORDER BY 
day;


-- (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.


PREPARE del FROM "DELETE FROM date_tbl ORDER BY created_at LIMIT ?";
SET @lim := (SELECT COUNT(*) -5 FROM date_tbl);
EXECUTE del USING @lim;


-- -----------------------------------------------------------------------------------------------------------------



#“Хранимые процедуры и функции, триггеры"

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER // 

DROP FUNCTION IF EXISTS hello;

CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
    CASE 
   		WHEN hour BETWEEN 0 AND 5 THEN 
   			RETURN "Доброй ночи"; 
        WHEN hour BETWEEN 6 AND 11 THEN 
       		RETURN "Доброе утро"; 
		WHEN hour BETWEEN 12 AND 17 THEN 
			RETURN "Добрый день"; 
		WHEN hour BETWEEN 18 AND 23 THEN 
			RETURN "Доброй ночи";
    END CASE;
END//

SELECT hello();

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них.
--  Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.



SELECT "TASK 2"//

DROP PROCEDURE IF EXISTS throw_error_if_true;

CREATE PROCEDURE throw_error_if_true(IN val BOOLEAN)
BEGIN
     DECLARE msg VARCHAR(50) DEFAULT "Only one field maybe NULL";

    IF (val) THEN 
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = msg;
    END IF;
END//
   
DROP TRIGGER IF EXISTS check_products_insert_not_null_fields;
CREATE TRIGGER check_products_insert_not_null_fields BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    DECLARE chk BOOLEAN DEFAULT (NEW.name IS NULL AND NEW.description IS NULL);
    CALL throw_error_if_true(chk);
END//

DROP TRIGGER IF EXISTS check_products_update_not_null_fields;
CREATE TRIGGER check_products_update_not_null_fields BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    DECLARE chk BOOLEAN DEFAULT (NEW.name IS NULL AND NEW.description IS NULL);
    CALL throw_error_if_true(chk);

END//


-- (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
-- Вызов функции FIBONACCI(10) должен возвращать число 55.

SELECT "TASK 3";
DROP FUNCTION IF EXISTS FIBONACCI; 
CREATE FUNCTION FIBONACCI(n INT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE p1 INT DEFAULT 1;
    DECLARE p2 INT DEFAULT 1;
    DECLARE i INT DEFAULT 2;
    DECLARE res INT DEFAULT 0;
   
    IF (n <= 1) THEN RETURN n;
    ELSEIF (n = 2) THEN RETURN 1;
    END IF;  
    WHILE i < n DO
        SET i = i + 1;
	SET res = p2 + p1;
        SET p2 = p1;
        SET p1 = res;
    END WHILE;
    RETURN res;
 END//
 
DELIMITER ;