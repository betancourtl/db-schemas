SET @tag_id = 1;

SELECT *
FROM posts_tags
  INNER JOIN posts p on posts_tags.post_id = p.id
WHERE tag_id = @tag_id;