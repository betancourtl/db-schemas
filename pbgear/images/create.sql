USE pbgear_db;

SET @url = 'http://placeho.it/450x300';

INSERT INTO images(url)
VALUES (@url)
