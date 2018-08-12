# Find users with posts
SET @user_id = 1;

SELECT
  username,
  email,
  COUNT(*) AS count
FROM users
  INNER JOIN posts p on users.id = p.user_id
WHERE user_id = @user_id;