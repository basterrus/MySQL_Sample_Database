-- Задание 1.
SELECT id, name, birthday_at FROM users;

SELECT users.id, users.name, users.birthday_at
  FROM users JOIN orders ON users.id = orders.user_id;

 
 -- Задание 2.
 select products.id, products.name, products.price, catalogs.name 
 	FROM products LEFT JOIN catalogs ON products.catalog_id = catalogs.id;
 	
 -- Задание 3.

 select f.id, cities_from.name AS `from`,   cities_to.name AS `to`
from flights AS f JOIN cities AS cities_from ON f.from = cities_from.label
  join cities AS cities_to ON f.to = cities_to.label;