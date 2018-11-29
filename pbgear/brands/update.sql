USE pbgear_db;

SET @id = 3;
SET @brand = 'TEST';

UPDATE brands
SET
   brand = @brand
WHERE id = @id;
