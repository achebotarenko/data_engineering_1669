/* Описать объекты и явления предметной области
1. Профиль
2. Друзья
3. Сообщения
4. Группы
5. Пост
6. Лайки
7. Файл
Создать первичные сущности
*/

/*
Аномалии: вставки, обновления, удаления
*/

CREATE DATABASE vk_20210910;
USE vk_20210910;

-- Таблица профилей

-- SERIAL
-- CHAR(8) - строка фиксированной длины
-- VARCHAR(255) - строка произвольной длины не более заданной

-- 897712345678

-- Тип
-- 1. Представление
-- 2. Способ хранения 
-- 3. Набор допустимых операций

-- Число: + - / *

-- Строка: подстроку, слепить две строки

CREATE TABLE profiles (
	id INT UNSIGNED COMMENT "Идентификатор строки",
    first_name VARCHAR(255) COMMENT "Имя пользователя",
    last_name VARCHAR(255) COMMENT "Фамилия пользователя",
    email VARCHAR(100) COMMENT "Почта",
    phone CHAR(11) COMMENT "Телефон",
    birthday DATE COMMENT "Дата рождения",
    `status` VARCHAR(30) COMMENT "Текущий статус",
    city VARCHAR(130) COMMENT "Город проживания",
    country VARCHAR(130) COMMENT "Страна проживания",    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT 'Таблица профилей';

SELECT * FROM profiles;
/*
1 Ivan Ivanov created  2021.01.01 2021.01.01
2 Ivan Ivanov online   2021.01.01 2021.01.02
3 Ivan Ivanov offline  2021.01.01 2021.01.02
*/

-- DEFAULT CURRENT_TIMESTAMP

SHOW TABLES;

DESCRIBE profiles;
DESC profiles;

-- PRIMARY KEY (NOT NULL, UNIQUE)

-- NOT NULL 
-- UNIQUE
-- DEFAULT
-- AUTO_INCREMENT

DROP TABLE users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", -- искуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone CHAR(11) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

-- SERIAL -> INT UNSIGNED NOT NULL AUTO_INCREMENT

DROP TABLE profiles;
CREATE TABLE profiles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",  
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  photo_id INT UNSIGNED COMMENT "Ссылка на основную фотографию пользователя",
  `status` VARCHAR(30) COMMENT "Текущий статус",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);
