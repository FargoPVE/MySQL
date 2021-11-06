-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products 
-- в таблицу logs помещается время и дата создания записи, название таблицы, 
-- идентификатор первичного ключа и содержимое поля name.
USE shop;

SET AUTOCOMMIT = 0;

START TRANSACTION;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	cteated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	table_name VARCHAR(100),
	id BIGINT,
	name_value VARCHAR(255)
) ENGINE=ARCHIVE;

DROP PROCEDURE IF EXISTS start_logs;
DROP TRIGGER IF EXISTS users_trg;
DROP TRIGGER IF EXISTS products_trg;
DROP TRIGGER IF EXISTS catalogs_trg;

DELIMITER //
CREATE PROCEDURE start_logs(IN table_name_ VARCHAR(100), IN id_ BIGINT, IN name_value_ VARCHAR(255))
BEGIN
		INSERT INTO logs(table_name, id, name_value) VALUES (table_name_, id_, name_value_);
END//

CREATE TRIGGER users_trg AFTER INSERT ON users
FOR EACH ROW
BEGIN
    CALL start_logs("users", NEW.id, NEW.name);
END//

CREATE TRIGGER products_trg AFTER INSERT ON products
FOR EACH ROW
BEGIN
    CALL start_logs("products", NEW.id, NEW.name);
END//

CREATE TRIGGER catalogs_trg AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
    CALL start_logs("catalogs", NEW.id, NEW.name);
END//
DELIMITER ;
COMMIT;

-- (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.


SET AUTOCOMMIT = 0;
SET cte_max_recursion_depth = 1000001;

START TRANSACTION;
SET @iter := 1;

INSERT INTO users(name,birthday_at) 
SELECT username, birthday 
FROM ( 
WITH RECURSIVE T (id, username, birthday) AS 
(
SELECT @iter,UUID(), FROM_UNIXTIME(RAND() * 2147483647)
UNION ALL
SELECT @iter := @iter + 1,
       UUID(), FROM_UNIXTIME(RAND() * 2147483647)
FROM T
WHERE @iter < 1000000
)
select username, birthday FROM T
)
COMMIT;

SET cte_max_recursion_depth = 1001; 