USE pbgear_db;

SET @item_id = 2;
SET @user_id = 1;

INSERT INTO likes (item_id, user_id)
VALUES (@item_id, @user_id)
