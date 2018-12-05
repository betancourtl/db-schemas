USE pbgear_db;

SET @id = 1;
SET @country = 'CA';

UPDATE countries
SET
  country = @country
WHERE id = @id;
