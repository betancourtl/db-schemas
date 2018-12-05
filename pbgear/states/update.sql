USE pbgear_db;

SET @id = 3;
SET @state = 'LL';

UPDATE states
SET
   state = @state
WHERE id = @id;
