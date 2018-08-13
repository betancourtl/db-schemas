SELECT *
FROM users
INNER JOIN posts p on users.id = p.user_id;