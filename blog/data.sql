INSERT INTO roles (role)
VALUES
  ('admin'),
  ('moderator'),
  ('user');

INSERT INTO users (role_id, username, email, password)
VALUES
  (1, 'webdeveloperpr', 'webdeveloperpr@gmail.com', 'root'),
  (2, 'mod-1', 'mod-1@gmail.com', 'root'),
  (3, 'user-1', 'user-1@gmail.com', 'root'),
  (2, 'mod-2', 'mod-2@gmail.com', 'root'),
  (3, 'user-2', 'user-2@gmail.com', 'root'),
  (2, 'mod3', 'mod-3@gmail.com', 'root');

INSERT INTO tags (tag)
VALUES
  ('js'),
  ('webpack'),
  ('functional programming'),
  ('react');

INSERT INTO categories (category)
VALUES
  ('Programming'),
  ('Node'),
  ('Javascript'),
  ('Go'),
  ('Scala');

INSERT INTO posts (user_id, slug, title, body, image_url)
VALUES
  (1, 'first-post', 'first post', 'Hello World! 1', 'http://placehold.it/450x300'),
  (2, 'second-post', 'second post', 'Hello World ! 2', 'http://placehold.it/450x300'),
  (3, 'third-post', 'third post', 'Hello World! 3', 'http://placehold.it/450x300'),
  (1, 'fourth-post', 'third post', 'Hello World! 3', 'http://placehold.it/450x300');

INSERT INTO posts_categories (post_id, category_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 4);

INSERT INTO posts_tags (post_id, tag_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 4);

INSERT INTO comments (user_id, post_id, comment)
VALUES
  (1, 2, 'I'),
  (1, 2, 'love'),
  (1, 2, 'your!'),
  (1, 2, 'your'),
  (1, 2, 'post'),
  (2, 2, 'Mee too!'),
  (3, 1, 'You change my life thank you!');

INSERT INTO likes (user_id, post_id)
VALUES
  (1, 2),
  (2, 2),
  (3, 2),
  (4, 2);
