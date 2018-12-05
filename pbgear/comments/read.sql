USE pbgear_db;

SET @id = 1;

SELECT status
FROM conditions
WHERE
  id = @id;
