--ЗАДАНИЕ 1

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя',
  birthday_at DATE COMMENT 'День рождения',
  created_at DATETIME,
  updated_at DATETIME);

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Иванов И.И.', '1965-12-15', NULL, NULL),
  ('Петров П.П.', '1994-06-22', NULL, NULL),
  ('Сидоров С.С.', '2009-01-31', NULL, NULL),
  ('Путин В.В.', '1975-05-01', NULL, NULL),
  ('Сечин И.И.', '1974-03-25', NULL, NULL);

update users set created_at = NOW(),  updated_at = NOW();

--ЗАДАНИЕ 2

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя',
  birthday_at DATE COMMENT 'День рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255) );

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Иванов И.И.', '1965-12-15','07.01.2016 12:05', '07.01.2016 12:05'),
  ('Петров П.П.', '1985-10-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('Сидоров С.С.', '2009-01-31', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('Путин В.В.', '1975-05-01','21.10.2016 9:14', '21.10.2016 9:14'),
  ('Сечин И.И.', '1974-03-25','15.12.2016 12:45', '15.12.2016 12:45');

update users SET
  created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
  updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
 
 
ALTER table users change created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER table users change updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

 
--ЗАДАНИЕ 3

CREATE TABLE productbase (
  id SERIAL PRIMARY KEY,
  productbase_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT into productbase (productbase_id, product_id, value)
VALUES
  (1, 652, 0),
  (1, 358, 2500),
  (1, 3262, 0),
  (1, 356, 30),
  (1, 111, 500),
  (1, 222, 1);

 select * from productbase ORDER by if (value > 0, 0, 1), value;
 
--ЗАДАНИЕ 4

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

-- ЗАДАНИЕ 5
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255));
 
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
 
SELECT * from catalogs;
SELECT * from catalogs where id IN (5, 1, 2) ORDER by FIELD(id, 5, 1, 2);


--АГРЕГАЦИЯ 1

select AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) as age from users;

--АГРЕГАЦИЯ 2

select DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total
from users GROUP by day ORDER by total DESC;
 
 






