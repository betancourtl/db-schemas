USE pbgear_db;

SET @item_id = 2;
SET @user_id = 1;

DELETE FROM likes
WHERE user_id = @user_id
AND item_id = @item_id;
