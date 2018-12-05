USE pbgear_db;

SET @id = 3;
SET @category = 'TESTSSS';

UPDATE categories
SET
   category = @category
WHERE id = @id;
