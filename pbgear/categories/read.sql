USE pbgear_db;

SET @id = 3;

SELECT category
FROM categories
WHERE
  id = @id;
