USE pbgear_db;

SET @item_id = 2;
SET @user_id = 1;

SELECT count(*) as likes
FROM likes
WHERE
  item_id = @item_id
  AND user_id = @user_id;
