USE pbgear_db;
# Get the item likes
# Get the item and left join all the foreign keys
# left join the images I had to do it with JSON
SELECT
  -- Get the item properties
  items.id,
  items.title,
  items.user_id,
  items.model,
  items.sold,
  items.description,
  items.year,
  items.price,
  items.created_at,
  items.updated_at,
  -- Get the total likes
  (
    SELECT COUNT(*)
    FROM likes AS l
    WHERE l.item_id = items.id
  ) AS likes,
  -- Get the images
  (
    SELECT IFNULL(concat('[', group_concat(concat('{"id": ', id, ', "url": "', url, '"}') SEPARATOR ','), ']}'),
                  '[]') AS images
    FROM item_images
      LEFT JOIN images ON item_images.image_id = images.id
    WHERE item_id = items.id
  ) AS images,
  -- Get the foreign key properties
  users.first_name,
  users.last_name,
  users.email,
  users.username,
  categories.category,
  brands.brand,
  conditions.status,
  countries.country,
  states.state
FROM items
  LEFT JOIN categories
    ON items.category_id = categories.id
  LEFT JOIN brands
    ON items.category_id = brands.id
  LEFT JOIN conditions
    ON items.condition_id = conditions.id
  LEFT JOIN countries
    ON items.country_id = countries.id
  LEFT JOIN states
    ON items.state_id = states.id
  LEFT JOIN users
    ON items.user_id = users.id
ORDER BY items.created_at DESC
LIMIT 15;

