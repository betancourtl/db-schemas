USE pbgear_db;

SET @id = 2;

SELECT brand
FROM brands
WHERE
  id = @id;
