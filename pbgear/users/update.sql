USE pbgear_db;

SET @id = 11;
SET @username = '@webdevaaeloperpr';
SET @password = 12345;
SET @email = 'Luis@gmaissl.coms';
SET @first_name = 'Ramon';
SET @last_name = 'De Jesus';

UPDATE users
SET
  username   = @username,
  password   = @password,
  email      = @email,
  first_name = @first_name,
  last_name  = @last_name
WHERE id = @id;