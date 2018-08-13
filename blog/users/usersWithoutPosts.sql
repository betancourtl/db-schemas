SELECT *
FROM users
  LEFT JOIN posts p on users.id = p.user_id
WHERE p.id IS NULL;