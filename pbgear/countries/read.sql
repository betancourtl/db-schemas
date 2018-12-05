USE pbgear_db;

SET @id = 1;

SELECT country
FROM countries
WHERE
  id = @id;
