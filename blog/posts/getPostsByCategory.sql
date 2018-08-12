SET @category_id = 1;

SELECT *
FROM posts_categories
  INNER JOIN posts p on posts_categories.post_id = p.id
WHERE category_id = @category_id;