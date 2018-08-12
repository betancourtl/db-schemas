SET @post_id = 2;

SELECT *
FROM comments
WHERE post_id = @post_id;