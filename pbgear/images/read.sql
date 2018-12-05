USE pbgear_db;

SET @id = 2;

SELECT url
FROM images
WHERE
  id = @id;
