USE pbgear_db;

SET @id = 2;

DELETE FROM countries
WHERE id = @id; 
