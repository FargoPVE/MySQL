DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  community_id BIGINT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (community_id) REFERENCES communities(id),
  FOREIGN KEY (media_id) REFERENCES media(id)
) COMMENT "Посты";

#для таблицы профиля предлагаю отдельно создать таблицы страны и города, откуда сам пользователь

ALTER TABLE profiles ADD COLUMN country VARCHAR(100) NOT NULL;
ALTER TABLE profiles MODIFY COLUMN hometown VARCHAR(100) NOT NULL;
ALTER TABLE profiles RENAME COLUMN hometown TO city;

DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  country VARCHAR(100) NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS city;
CREATE TABLE city(
  id SERIAL PRIMARY KEY,
  city VARCHAR(100) NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

