USE pbgear_db;

SET @id = 2;

DELETE FROM categories
WHERE id = @id; 
