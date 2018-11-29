USE pbgear_db;

SET @id = 1;
SET @user_id = 1;
SET @model = 'Dye';
SET @title = 'LNIB Dye M3';
SET @sold = FALSE;
SET @description = 'Dye';
SET @year = 2025;
SET @price = 2540;
SET @brand_id = 1;
SET @condition_id = 1;
SET @country_id = 1;
SET @state_id = 1;
SET @category_id = 1;

UPDATE items
SET
  year = @year
#   user_id      = @user_id,
#   model        = @model,
#   title        = @title,
#   sold         = @sold,
#   description  = @description,
#   price        = @price,
#   brand_id     = @brand_id,
#   condition_id = @condition_id,
#   country_id   = @country_id,
#   state_id     = @state_id,
#   category_id  = @category_id
WHERE id = @id;
