SET @post_id = 1;

# post tags
SELECT *
FROM posts_tags
  INNER JOIN tags t on posts_tags.tag_id = t.id
WHERE post_id = @post_id;
