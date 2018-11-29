USE pbgear_db;

SET @user_id = 1;
SET @model = 'Dye';
SET @title = 'LNIB Dye M3';
SET @sold = FALSE;
SET @description = 'Dye';
SET @year = 2005;
SET @price = 2540;
SET @brand_id = 1;
SET @condition_id = 1;
SET @country_id = 1;
SET @state_id = 1;
SET @category_id = 1;

SELECT
  items.model,
  items.title,
  items.sold,
  items.description,
  items.year,
  items.price,
  users.username,
  brands.brand,
  conditions.status,
  countries.country,
  states.state,
  categories.category,
  (
    SELECT IFNULL(concat('[', group_concat(concat('{"id": ', id, ', "url": "', url, '"}') SEPARATOR ','), ']'), '[]') AS images
    FROM item_images
      LEFT JOIN images
        ON item_images.image_id = images.id
    WHERE item_id = items.id
  ) AS images
FROM items
  LEFT JOIN users
    ON items.user_id = users.id
  LEFT JOIN brands
    ON items.brand_id = brands.id
  LEFT JOIN conditions
    ON items.condition_id = conditions.id
  LEFT JOIN countries
    ON items.country_id = countries.id
  LEFT JOIN states
    ON items.state_id = states.id
  LEFT JOIN categories
    ON items.category_id = categories.id
WHERE
  items.id IS NOT NULL
  AND items.user_id = @user_id
#   AND items.model = @model
#   AND items.title LIKE CONCAT('%', @title, '%')
#   AND items.sold = @sold
#   AND items.description LIKE CONCAT('%', @description, '%')
#   AND items.year BETWEEN 0 AND @year
#   AND items.price BETWEEN 0 AND @price
#   AND items.brand_id = @brand_id
#   AND items.condition_id = @condition_id
#   AND items.country_id = @country_id
#   AND items.state_id = @state_id
#   AND items.category_id = @category_id
