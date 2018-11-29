USE pbgear_db;

INSERT INTO categories (category)
VALUES
  ('markers'),
  ('accessories'),
  ('barrels'),
  ('harness'),
  ('loaders'),
  ('pads'),
  ('pants'),
  ('shirts'),
  ('tanks'),
  ('gearbags');

INSERT INTO brands (brand)
VALUES
  ('dye'),
  ('eclipse'),
  ('tippmann'),
  ('empire'),
  ('custom products'),
  ('valken'),
  ('first strike'),
  ('virtue'),
  ('pinokio'),
  ('kingman'),
  ('jt'),
  ('angel'),
  ('wdp'),
  ('other'),
  ('ninja');

INSERT INTO users (username, password, email, first_name, last_name)
VALUES
  ('@admin', '123', 'admin@gmail.com', 'Luis', 'Betancourt'),
  ('@cocker', '123', 'cocker@gmail.com', 'Budd', 'Orr'),
  ('@eclipse', '123', 'eclipse@gmail.com', 'Jack', 'Wood'),
  ('@dye', '123', 'Dye@gmail.com', 'Ollie', 'Lang');

INSERT INTO conditions (status)
VALUES
  ('new'),
  ('used');

INSERT INTO countries (country)
VALUES ('US');

INSERT INTO states (state)
VALUES
  ('AL'),
  ('AK'),
  ('AS'),
  ('AZ'),
  ('AR'),
  ('CA'),
  ('CO'),
  ('CT'),
  ('DE'),
  ('DC'),
  ('FM'),
  ('FL'),
  ('GA'),
  ('GU'),
  ('HI'),
  ('ID'),
  ('IL'),
  ('IN'),
  ('IA'),
  ('KS'),
  ('KY'),
  ('LA'),
  ('ME'),
  ('MH'),
  ('MD'),
  ('MA'),
  ('MI'),
  ('MN'),
  ('MS'),
  ('MO'),
  ('MT'),
  ('NE'),
  ('NV'),
  ('NH'),
  ('NJ'),
  ('NM'),
  ('NY'),
  ('NC'),
  ('ND'),
  ('MP'),
  ('OH'),
  ('OK'),
  ('OR'),
  ('PW'),
  ('PA'),
  ('PR'),
  ('RI'),
  ('SC'),
  ('SD'),
  ('TN'),
  ('TX'),
  ('UT'),
  ('VT'),
  ('VI'),
  ('VA'),
  ('WA'),
  ('WV'),
  ('WI'),
  ('WY');


INSERT INTO country_states (country_id, state_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7),
  (1, 8),
  (1, 9),
  (1, 10),
  (1, 11),
  (1, 12),
  (1, 13),
  (1, 14),
  (1, 15),
  (1, 16),
  (1, 17),
  (1, 18),
  (1, 19),
  (1, 20),
  (1, 21),
  (1, 22),
  (1, 23),
  (1, 24),
  (1, 25),
  (1, 26),
  (1, 27),
  (1, 28),
  (1, 29),
  (1, 30),
  (1, 31),
  (1, 32),
  (1, 33),
  (1, 34),
  (1, 35),
  (1, 36),
  (1, 37),
  (1, 38),
  (1, 39),
  (1, 40),
  (1, 41),
  (1, 42),
  (1, 43),
  (1, 44),
  (1, 45),
  (1, 46),
  (1, 47),
  (1, 48),
  (1, 49),
  (1, 50),
  (1, 51),
  (1, 52),
  (1, 53),
  (1, 54),
  (1, 55),
  (1, 56),
  (1, 57),
  (1, 58);

INSERT INTO items (model, title, sold, description, year, price, category_id, brand_id, user_id, condition_id, country_id, state_id)
VALUES
  ('Dye M3', 'LNIB Dye M3', FALSE, 'Dye M3 Like New!', 2005, 1200.00, 1, 1, 1, 2, 1, 30),
  ('Ego 2007', 'LNIB Ego 2007', TRUE, 'LNIB Ego 2007', 2007, 300.00, 1, 2, 1, 2, 1, 30);

INSERT INTO images (url)
VALUES
  ('http://placehold.it/450x300'),
  ('http://placehold.it/450x300'),
  ('http://placehold.it/450x300'),
  ('http://placehold.it/450x300'),
  ('http://placehold.it/450x300');

INSERT INTO item_images (item_id, image_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (2, 5);

INSERT INTO likes (item_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3)
;

INSERT INTO comments (comment, user_id, item_id)
VALUES
  ('Nice Marker!', 1, 1),
  ('How much for it?', 2, 1)
;