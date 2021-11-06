#Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
#который больше всех общался с выбранным пользователем (написал ему сообщений).


-- первый вариант, но с ним не получилось, выдает ошибку 
-- SQL Error [1235] [42000]: This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
SELECT from_user_id, COUNT(from_user_id) AS 'max_count' 
FROM messages
WHERE to_user_id = 5
GROUP BY from_user_id
ORDER BY max_count DESC LIMIT 1


-- Второй вариант (рабочий)
SELECT from_user_id
FROM messages
WHERE to_user_id = 5
GROUP BY from_user_id
HAVING COUNT(*) > 1


SELECT * FROM users WHERE id IN (
	SELECT from_user_id
	FROM messages
	WHERE to_user_id = 5
	GROUP BY from_user_id
	HAVING COUNT(*) > 1)

#Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.


SELECT 
	COUNT(*) AS 'amount_likes'
FROM likes 
WHERE media_id IN (
	SELECT id FROM media WHERE user_id IN (
		SELECT user_id FROM profiles WHERE (birthday + INTERVAL 10 YEAR) > NOW()
  )
)


#Определить кто больше поставил лайков (всего): мужчины или женщины.

-- нашел похожий пример и адаптировал его
SELECT
    CASE (gender)
         WHEN 'm' THEN 'мужчины'
         WHEN 'f' THEN 'женщины'
    END AS gender,
    COUNT(gender) AS 'кол-во'
FROM profiles, 
	likes
WHERE likes.user_id = profiles.user_id
GROUP BY gender
ORDER BY 'кол-во' DESC LIMIT 1;

-- сделал, как было показано на вебинаре, но теперь другие значения
SELECT
    CASE (gender)
         WHEN 'm' THEN 'мужчины'
         WHEN 'f' THEN 'женщины'
    END AS gender,
    COUNT(gender) AS 'кол-во лайков'
FROM profiles
WHERE user_id IN (SELECT user_id FROM likes)
GROUP BY gender
ORDER BY 'кол-во лайков' DESC LIMIT 1;

