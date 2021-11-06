#Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
#который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT 
	to_user_id,
	u.firstname,
	u.lastname,
	COUNT(*) AS 'messages count'
FROM messages m 
JOIN users u ON u.id = m.from_user_id
WHERE to_user_id = 5
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

#Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.


SELECT 
	COUNT(*) AS 'amount_likes'
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.user_id 
WHERE (p.birthday + INTERVAL 10 YEAR) > NOW();


#Определить кто больше поставил лайков (всего): мужчины или женщины.

-- нашел похожий пример и адаптировал его
SELECT
    CASE (gender)
         WHEN 'm' THEN 'мужчины'
         WHEN 'f' THEN 'женщины'
    END AS gender,
    COUNT(*) AS 'кол-во'
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY gender;
