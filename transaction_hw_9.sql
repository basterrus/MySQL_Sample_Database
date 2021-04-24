-- Задание1.

SELECT * FROM shop.users;
SELECT * FROM sample.users;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Задание 2.

CREATE OR REPLACE VIEW products_catalogs as SELECT
  p.name AS product,
  c.name AS catalog
from products join catalogs on products.catalog_id = catalogs.id;

-- Задание 3.

select DATE('2015-06-11') - INTERVAL last_days.day DAY AS day,
  NOT ISNULL(posts.name) AS order_exist
from last_days LEFT join posts on DATE(DATE('2015-06-11') - INTERVAL last_days.day DAY) = posts.created_at ORDER by day;

-- Задание 4.

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  created_at DATE NOT NULL
);

INSERT INTO posts VALUES
(NULL, 'Один', '2018-11-01'),
(NULL, 'Два', '2018-11-02'),
(NULL, 'Три', '2018-11-03'),
(NULL, 'Четыре', '2018-11-04'),
(NULL, 'Пять', '2018-11-05'),
(NULL, 'Шесть', '2018-11-06'),
(NULL, 'Семь', '2018-11-07'),
(NULL, 'Восемь', '2018-11-08'),
(NULL, 'Девять', '2018-11-09'),
(NULL, 'Десять', '2018-11-10');

delete posts
from  posts join (select created_at from posts order by created_at desc LIMIT 5, 1) AS delpst on posts.created_at <= delpst.created_at;

SELECT * FROM posts;

