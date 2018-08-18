-- insert into the creatives and then insert into the users_creatives table
SET @name = 'template1';
SET @description = 'Test template';
SET @html = '<p>New Template</p>';
SET @user_id = 1;

INSERT INTO creatives (name, description, html)
VALUES (@name, @description, @html);

SET @creative_id = (SELECT LAST_INSERT_ID());

INSERT INTO users_creatives (user_id, creative_id)
VALUES (@user_id, @creative_id);
