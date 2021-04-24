-- Задание 1

SELECT profiles.gender, COUNT(likes.id) AS total_likes
  from likes join profiles on likes.user_id = profiles.user_id
    group by profiles.gender
    	order by total_likes desc limit 1;
    
-- Задание 2

SELECT SUM(got_likes) AS total_likes_for_youngest
  FROM (SELECT COUNT(DISTINCT likes.id) AS got_likes 
      FROM profiles LEFT JOIN likes ON likes.target_id = profiles.user_id AND target_type_id = 2
      GROUP BY profiles.user_id
      ORDER BY profiles.birthday desc LIMIT 10
) AS youngest;   


-- Задание 3

SELECT users.id,
  COUNT(DISTINCT messages.id) + 
  COUNT(DISTINCT likes.id) + 
  COUNT(DISTINCT media.id) AS activity 
  FROM users 
  LEFT JOIN messages ON users.id = messages.from_user_id 
  LEFT JOIN likes ON users.id = likes.user_id LEFT JOIN media ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity
  LIMIT 10;