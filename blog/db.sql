DROP DATABASE IF EXISTS blog_db;
CREATE DATABASE blog_db;
USE blog_db;

CREATE TABLE roles (
  id        INT PRIMARY KEY       AUTO_INCREMENT,
  role      VARCHAR(50) NOT NULL,
  create_at DATETIME    NOT NULL  DEFAULT NOW(),
  update_at DATETIME    NOT NULL  DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE users (
  id         INT PRIMARY KEY       AUTO_INCREMENT,
  username   VARCHAR(25)  NOT NULL,
  password   VARCHAR(80)  NOT NULL,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  email      VARCHAR(255) NOT NULL UNIQUE,
  address    VARCHAR(255),
  zip        varchar(10), -- 00921-234
  phone      VARCHAR(15), -- +1 787-234-4321
  role_id    INT,
  create_at  DATETIME     NOT NULL DEFAULT NOW(),
  update_at  DATETIME     NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE SET NULL
);

CREATE TABLE posts (
  id        INT PRIMARY KEY           AUTO_INCREMENT,
  slug      VARCHAR(255) UNIQUE,
  title     VARCHAR(255) NOT NULL,
  image_url VARCHAR(255),
  body      TEXT,
  user_id   INT          NOT NULL,
  create_at DATETIME     NOT NULL     DEFAULT NOW(),
  update_at DATETIME     NOT NULL     DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE tags (
  id        INT PRIMARY KEY       AUTO_INCREMENT,
  tag       VARCHAR(100),
  create_at DATETIME NOT NULL     DEFAULT NOW(),
  update_at DATETIME NOT NULL     DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE categories (
  id        INT PRIMARY KEY           AUTO_INCREMENT,
  category  VARCHAR(100) NOT NULL,
  create_at DATETIME     NOT NULL     DEFAULT NOW(),
  update_at DATETIME     NOT NULL     DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE posts_tags (
  post_id INT NOT NULL,
  tag_id  INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE,
  PRIMARY KEY (post_id, tag_id)
);

CREATE TABLE posts_categories (
  post_id     INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE,
  PRIMARY KEY (post_id, category_id)
);

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
