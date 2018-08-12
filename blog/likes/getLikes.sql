SET @post_id = 2;

SELECT
  COUNT(*) as total_likes
FROM likes
  INNER JOIN users u on likes.user_id = u.id
WHERE post_id = @post_id