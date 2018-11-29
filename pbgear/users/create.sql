USE pbgear_db;

SET @username = '@webdevaaesloperpr';
SET @password = 12345;
SET @email = 'Luis@gmaissl.coms';
SET @first_name = 'Luis';
SET @last_name = 'Betancourt';

-- Get the user
INSERT INTO users (username, password, email, first_name, last_name)
VALUES (@username, @password, @email, @first_name, @last_name);
