-- select all creative that belong to the user
SET @user_id = 1;

SELECT *
FROM users_creatives
  LEFT JOIN creatives c on users_creatives.creative_id = c.id
WHERE user_id = @user_id;

