USE pbgear_db;

SET @id = 4;
SET @status = 'new';

UPDATE conditions
SET
   status = @status
WHERE id = @id;
