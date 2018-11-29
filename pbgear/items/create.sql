USE pbgear_db;

SET @user_id = 11;
SET @model = 'M3';
SET @title = 'LNIB Dye M3';
SET @sold = FALSE;
SET @description = 'Dye M3 Like New!';
SET @year = 2005;
SET @price = 1200.00;
SET @brand_id = 1;
SET @condition_id = 1;
SET @country_id = 1;
SET @state_id = 1;
SET @category_id = 1;

INSERT INTO items (model, title, sold, description, year, price, category_id, brand_id, user_id, condition_id, country_id, state_id)
VALUES (@model, @title, @sold, @description, @year, @year, @category_id, @brand_id, @user_id, @condition_id, @condition_id, @state_id)
