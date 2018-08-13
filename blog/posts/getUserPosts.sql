SET @user_id = 1;

SELECT *
FROM posts
WHERE posts.user_id = @user_id;
