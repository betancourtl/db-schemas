USE pbgear_db;

SET @id = 11;
SET @username = '@webdevaaeloperpr';
SET @email = 'Luis@gmaissl.coms';
SET @first_name = 'Ramon';
SET @last_name = 'De Jesus';

SELECT
  id,
  first_name,
  last_name,
  username,
  created_at,
  updated_at
FROM users
WHERE
  users.id IS NOT NULL
  AND users.first_name = @first_name
  # AND users.id = @id
  # AND users.last_name = @last_name
  # AND users.username = @username;
  # AND users.email = @email;