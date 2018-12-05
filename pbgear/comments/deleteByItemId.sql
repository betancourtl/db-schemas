USE pbgear_db;

set @item_id =  1;

DELETE FROM comments
WHERE item_id = @item_id; 
