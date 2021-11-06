#Less_4

-- ii. Написать скрипт, возвращающий список имен (только firstname) 
-- пользователей без повторений в алфавитном порядке


SELECT firstname FROM users ORDER BY firstname ASC;


-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных 
-- (поле is_active = false). Предварительно добавить такое поле в таблицу profiles 
-- со значением по умолчанию = true (или 1)


ALTER TABLE profiles ADD COLUMN is_active INT NOT NULL DEFAULT(1);


UPDATE profiles
SET 
	is_active = 2
WHERE
	YEAR(CURRENT_DATE())  - YEAR(birthday) < 18;


-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

INSERT INTO messages VALUES
('21','1','3','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','2045-08-28 22:44:29')

DELETE FROM messages 
WHERE created_at > CURRENT_TIMESTAMP();
