-- insert into the creatives and then insert into the users_creatives table
SET @creative_id = 1;

DELETE FROM creatives
WHERE creatives.id = @creative_id;
