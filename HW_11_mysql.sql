-- —оздайте таблицу logs типа Archive. ѕусть при каждом создании записи в таблицах users,
-- catalogs и products в таблицу logs помещаетс€ врем€ и дата создани€ записи, название
-- таблицы, идентификатор первичного ключа и содержимое пол€ name.

DROP TABLE IF EXISTS logs;
DROP TRIGGER IF EXISTS log_users;
DROP TRIGGER IF EXISTS log_catalogs;
DROP TRIGGER IF EXISTS log_products;

CREATE TABLE logs (
date_of_ins datetime,
table_name varchar(255) ,
table_id integer,
name_from_table varchar(255) 
) ENGINE=ARCHIVE;

DELIMITER //

CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
  INSERT INTO logs(date_of_ins ,table_name ,table_id ,name_from_table ) VALUES (NOW(), 'users', new.id, name);
END//

CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
 INSERT INTO logs(date_of_ins ,table_name ,table_id ,name_from_table ) VALUES (NOW(), 'catalogs', new.id , name );
END//

CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
  INSERT INTO logs(date_of_ins ,table_name ,table_id ,name_from_table ) VALUES (NOW(), 'products', new.id, name);
END//

DELIMITER ;



