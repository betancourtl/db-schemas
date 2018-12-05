USE pbgear_db;

SET @comment = 'Updated comment';
SET @item_id = 1;
SET @user_id = 1;

UPDATE comments
SET
  comment = @comment
WHERE
  item_id = @item_id AND
  user_id = @user_id;
