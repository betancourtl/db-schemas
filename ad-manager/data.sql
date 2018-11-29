USE ad_manager_db;

INSERT INTO users (username, email, first_name, last_name)
VALUES
  ('Luis', 'luis@gmail.com', 'Luis', 'Betancourt'),
  ('Ramon', 'ramon@gmail.com', 'Ramon', 'Betancourt'),
  ('Julio', 'julio@gmail.com', 'Julio', 'Betancourt'),
  ('Andrea', 'andrea@gmail.com', 'Andrea', 'Betancourt');

INSERT INTO creatives (name, description, html)
VALUES
  ('template 1', 'test template', '<p>Template 1!</p>'),
  ('template 2', 'test template', '<p>Template 2!</p>'),
  ('template 3', 'test template', '<p>Tempalte 3!</p>');

INSERT INTO users_creatives (user_id, creative_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3);