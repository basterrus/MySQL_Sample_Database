-- Задание 3.

select profiles.gender, count(*) as likes 
from profiles join likes on profiles.user_id = likes.user_id 
group by gender order by likes desc limit 1;




-- 4 Подсчитать общее количество лайков десяти самым молодым пользователям
select profiles.*, likes.*
	from profiles join likes on profiles.user_id = likes.user_id
				order by birthday desc limit 10;
		
-- запутался вообщем в синтаксисе, либо считает сумму всех лайков либо выдает ошибку. Осталось вставить функцию суммы и вывести сумму
			
-- 5 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
 
select CONCAT(first_name, ' ', last_name) AS user,
	likes.target_id,
	messages.is_important
	from users 
	join messages on users.id = messages.id 
	join likes on users.id = likes.id
		order by likes.target_id, messages.is_important
			desc limit 10;

				
			
