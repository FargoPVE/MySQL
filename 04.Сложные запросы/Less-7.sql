#Составьте список пользователей users, 
#которые осуществили хотя бы один заказ orders в интернет магазине.


SELECT id, name FROM users WHERE id = (SELECT user_id FROM orders);


#Выведите список товаров products и разделов catalogs, который соответствует товару.
	

SELECT 
	p.name,
	p.description,
	p.price,
	c.name
FROM 
	products AS p
JOIN
	catalogs AS c
WHERE 
	p.catalog_id = c.id;
	

#(по желанию) Пусть имеется таблица рейсов flights (id, from, to)
#и таблица городов cities (label, name). 
#Поля from, to и label содержат английские названия городов, поле name — русское. 
#Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	f_from VARCHAR(100) NOT NULL,
	f_to VARCHAR(100) NOT NULL
);


INSERT INTO flights
	(id, f_from, f_to)
VALUES
	(NULL, 'moscow', 'omsk'),
	(NULL, 'novgorod', 'kazan'),
	(NULL, 'irkutsk', 'moscow'),
	(NULL, 'omsk', 'irkutsk'),
	(NULL, 'moscow', 'kazan');


DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(100) NOT NULL,
	name VARCHAR(100) NOT NULL
);


INSERT INTO cities
	(label, name)
VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	

SELECT 
	id,
	(SELECT name FROM cities WHERE label = f_from) AS 'from',
	(SELECT name FROM cities WHERE label = f_to) AS 'to'
FROM
	flights
ORDER BY
	id;