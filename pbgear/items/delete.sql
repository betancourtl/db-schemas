USE pbgear_db;

SET @id = 5;

DELETE FROM items
WHERE id = @id; 
