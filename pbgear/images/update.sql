USE pbgear_db;

SET @id = 3;
SET @url = 'http://placehold.it/600x800';

UPDATE images
SET
   url = @url
WHERE id = @id;
