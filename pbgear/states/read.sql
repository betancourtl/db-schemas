USE pbgear_db;

SET @id = 3;

SELECT state
FROM states
WHERE
  id = @id;
