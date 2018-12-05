USE pbgear_db;

SET @comment = 'This is a comment!';
SET @item_id = 1;
SET @user_id = 1;

INSERT INTO comments (comment, item_id, user_id)
VALUES (@comment, @item_id, @user_id)
