SET @user_id = 1;

## post with id
SELECT *
FROM posts
WHERE posts.user_id = @user_id;
