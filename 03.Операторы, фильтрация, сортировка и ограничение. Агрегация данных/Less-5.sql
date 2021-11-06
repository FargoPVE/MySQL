#“Операторы, фильтрация, сортировка и ограничение”

#1) Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
#Заполните их текущими датой и временем.

USE shop;
SELECT created_at, updated_at FROM users;


UPDATE users
	SET created_at = NOW(),
		updated_at = NOW();
		

#2) Таблица users была неудачно спроектирована. 
#Записи created_at и updated_at были заданы типом VARCHAR 
#и в них долгое время помещались значения в формате "20.10.2017 8:10". 
#Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

	
ALTER TABLE users 
MODIFY COLUMN created_at DATETIME;


ALTER TABLE users 
MODIFY COLUMN updated_at DATETIME;


SELECT created_at, updated_at FROM users;



#3) В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
#0, если товар закончился и выше нуля, если на складе имеются запасы. 
#Необходимо отсортировать записи таким образом, 
#чтобы они выводились в порядке увеличения значения value. 
#Однако, нулевые запасы должны выводиться в конце, после всех записей.


SELECT * FROM storehouses_products;


INSERT INTO
    storehouses_products (storehouse_id, product_id, value)
VALUES
    (1, 2, 6),
    (2, 7, 0),
    (4, 4, 3),
    (8, 8, 7),
    (3, 1, 0);
    
   
SELECT * FROM storehouses_products;


SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;


#4) (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
#Месяцы заданы в виде списка английских названий ('may', 'august')


SELECT * FROM users;


SELECT id, name, birthday_at FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august');


#5) (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
#SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
#Отсортируйте записи в порядке, заданном в списке IN.


SELECT * FROM catalogs WHERE id IN (5, 1, 2);


SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

-- --------------------------------------------------------------------------------------


#“Агрегация данных”


#1) Подсчитайте средний возраст пользователей в таблице users


SELECT * FROM users;


-- первый вариант
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS AVG_Age FROM users;


-- второй вариант
SELECT ROUND(AVG(YEAR(NOW()) - YEAR(birthday_at)), 0) AS 'Average' FROM users;


-- третий вариант
SELECT ROUND(AVG((TO_DAYS(NOW())-TO_DAYS(birthday_at))/365.242199), 0) AS 'Average' FROM users;


#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
#Следует учесть, что необходимы дни недели текущего года, а не года рождения.


SELECT YEAR(NOW());


SELECT 
	SUBSTRING(birthday_at, 6, 10) 
FROM 
	users;


SELECT 
	CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10)) AS 'birthday' 
FROM 
	users;


SELECT 
	DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS 'dayname_of_birthday' 
FROM 
	users; 

SELECT 
	DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS 'dayname_of_birthday', 
	COUNT(*) AS 'amount'
FROM
	users
GROUP BY
	dayname_of_birthday
ORDER BY
	amount DESC;


#(по желанию) Подсчитайте произведение чисел в столбце таблицы

CREATE TABLE tbl(
	test INT NOT NULL
);


INSERT INTO tbl VALUES
(1),
(2),
(3),
(4),
(5);

-- первый вариант
SELECT EXP(SUM(LN(test))) AS 'factorial' FROM tbl;


-- второй вариант
SELECT ROUND(EXP(SUM(LOG(test))), 0) AS factorial FROM tbl;