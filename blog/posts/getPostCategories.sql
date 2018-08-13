SET @post_id = 1;

SELECT *
FROM posts_categories
  INNER JOIN categories c on posts_categories.category_id = c.id
WHERE post_id = @post_id;
