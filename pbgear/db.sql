DROP DATABASE IF EXISTS pbgear_db;
CREATE DATABASE pbgear_db;
USE pbgear_db;

CREATE TABLE users (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  email      VARCHAR(255) UNIQUE NOT NULL,
  username   VARCHAR(255) UNIQUE NOT NULL,
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# We can put items like bags, paintball markers, barrels, loaders etc.
CREATE TABLE categories (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255) UNIQUE,
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# Dye, Planet Eclipse, Shocker
CREATE TABLE brands (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255),
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE countries (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  country    VARCHAR(50) NOT NULL,
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# We want to support multiple countries
CREATE TABLE states (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  state      VARCHAR(2) NOT NULL UNIQUE,
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE country_states (
  country_id INT NOT NULL,
  state_id   INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (country_id) REFERENCES countries (id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  PRIMARY KEY (country_id, state_id)
);

# item's condition (new|used)
CREATE TABLE conditions (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  status     VARCHAR(255) UNIQUE,
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# Users can make posts for their gear. Gear can have a year, description, price, brands, and location etc.
CREATE TABLE items (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  title        VARCHAR(255) NOT NULL,
  model        VARCHAR(255),
  sold         BOOL,
  description  TEXT,
  year         YEAR(4),
  price        DECIMAL(9, 2),
  created_at   DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at   DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  category_id  INT          NOT NULL,
  brand_id     INT          NOT NULL,
  user_id      INT          NOT NULL,
  condition_id INT          NOT NULL,
  country_id   INT,
  state_id     INT,
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE,
  FOREIGN KEY (brand_id) REFERENCES brands (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (condition_id) REFERENCES conditions (id) ON DELETE CASCADE,
  FOREIGN KEY (country_id, state_id) REFERENCES country_states (country_id, state_id) ON DELETE CASCADE
);

CREATE TABLE images (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  url        VARCHAR(255),
  created_at DATETIME        DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# Items can have many images.
CREATE TABLE item_images (
  item_id  INT NOT NULL,
  image_id INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE,
  FOREIGN KEY (image_id) REFERENCES images (id) ON DELETE CASCADE
);

# Users can like items
# Users can only like items 1 time.
CREATE TABLE likes (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  item_id    INT NOT NULL,
  user_id    INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, item_id)
);
