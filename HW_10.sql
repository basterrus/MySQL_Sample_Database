-- Задание 1. Индексы

CREATE INDEX users_first_last_name_idx ON users(first_name, last_name);

CREATE INDEX users_city_country_idx ON profiles(city, country);

-- alter table users drop index users_contact_idx;
create unique INDEX users_contact_idx ON users(phone, email);

CREATE INDEX messages_created_at_idx ON messages(created_at);

CREATE INDEX media_updated_at_idx ON media(updated_at);

CREATE INDEX posts_updated_at_idx ON posts(updated_at);

-- Задание 2.
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы;
-- среднее количество пользователей в группах;
-- самый молодой пользователь в группе;
-- самый старший пользователь в группе;
-- общее количество пользователей в группе;
-- всего пользователей в системе;
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100.

SELECT DISTINCT communities.name,
  AVG(communities_users.user_id) OVER (PARTITION BY communities_users.community_id) AS AVG_users,
  MIN(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS old,
  MAX(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS yang,
  COUNT(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS quantity_users,
  COUNT(profiles.user_id) OVER () AS total_users,
  COUNT(profiles.birthday) OVER (PARTITION BY communities_users.community_id) / COUNT(users.id) OVER() * 100 AS "%%"
  FROM communities JOIN communities_users ON communities.id = communities_users.community_id
    LEFT JOIN users ON communities_users.user_id = users.id
    JOIN profiles ON users.id = profiles.user_id;
       

       