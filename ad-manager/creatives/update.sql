SET @creative_id = 11;
SET @name = 'New Name';
SET @description = 'New Description';
SET @html = '<p>HTML updated!</p>';

UPDATE creatives
SET
  name        = @name,
  description = @description,
  html        = @html
WHERE id = @creative_id;