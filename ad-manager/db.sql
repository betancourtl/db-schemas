DROP DATABASE IF EXISTS ad_manager_db;
CREATE DATABASE ad_manager_db;
USE ad_manager_db;

CREATE TABLE users (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  username   VARCHAR(255) UNIQUE,
  email      VARCHAR(255) UNIQUE,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  created_at DATETIME        DEFAULT NOW(),
  updated_at DATETIME        DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE creatives (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(255),
  description TEXT,
  html        TEXT,
  created_at  DATETIME        DEFAULT NOW(),
  updated_at  DATETIME        DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE users_creatives (
  user_id     INT NOT NULL,
  creative_id INT NOT NULL,
  created_at  DATETIME DEFAULT NOW(),
  updated_at  DATETIME DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (creative_id) REFERENCES creatives (id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, creative_id)
);
