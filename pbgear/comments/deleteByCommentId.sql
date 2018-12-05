USE pbgear_db;

set @comment_id =  3;

DELETE FROM comments
WHERE id = @comment_id; 
