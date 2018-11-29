USE pbgear_db;

SET @id = 9;

DELETE FROM users
WHERE users.id = @id;
