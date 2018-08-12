DROP DATABASE IF EXISTS instagram_db;
CREATE DATABASE instagram_db;
USE instagram_db;

CREATE TABLE users (
  id         INT PRIMARY KEY                  AUTO_INCREMENT,
  username   VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  -- email      VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME     NOT NULL            DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME     NOT NULL            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE photos (
  id         INT PRIMARY KEY             AUTO_INCREMENT,
  user_id    INT          NOT NULL,
  image_url  VARCHAR(255) NOT NULL,
  created_at DATETIME     NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME     NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE comments (
  id         INT PRIMARY KEY             AUTO_INCREMENT,
  comment    VARCHAR(255) NOT NULL,
  photo_id   INT          NOT NULL,
  user_id    INT          NOT NULL,
  created_at DATETIME     NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME     NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (photo_id) REFERENCES photos (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE likes (
  photo_id   INT,
  user_id    INT,
  created_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (photo_id) REFERENCES photos (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  PRIMARY KEY (photo_id, user_id) # Allows only 1 like per user/photo
);

CREATE TABLE follows (
  follower_id INT,
  followee_id INT,
  created_at  DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (followee_id) REFERENCES users (id),
  FOREIGN KEY (follower_id) REFERENCES users (id),
  PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags (
  id         INT PRIMARY KEY         AUTO_INCREMENT,
  tag_name   VARCHAR(100) UNIQUE,
  created_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE photo_tags (
  tag_id     INT,
  photo_id   INT,
  created_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (tag_id) REFERENCES tags (id),
  FOREIGN KEY (photo_id) REFERENCES photos (id),
  PRIMARY KEY (tag_id, photo_id)
);

DELIMITER $$
CREATE TRIGGER example_cannot_follow_self_again
  BEFORE INSERT ON follows
  FOR EACH ROW
  BEGIN
    IF NEW.follower_id = NEW.followee_id
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
    END IF;
  END;
$$