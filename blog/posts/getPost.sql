SET @post_id = 1;

## post with id
SELECT *
FROM posts
WHERE posts.id = @post_id;

