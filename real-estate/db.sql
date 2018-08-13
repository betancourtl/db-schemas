-- users
-- properties
-- agents

DROP DATABASE IF EXISTS real_estates_db;
CREATE DATABASE real_estates_db;
USE real_estates_db;

# Every user needs a role
CREATE TABLE roles (
  id        INT PRIMARY KEY       AUTO_INCREMENT,
  role      VARCHAR(255), -- user, agent, admin
  create_at DATETIME NOT NULL     DEFAULT NOW(),
  update_at DATETIME NOT NULL     DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE users (
  id         INT PRIMARY KEY       AUTO_INCREMENT,
  username   VARCHAR(25)  NOT NULL,
  password   VARCHAR(80)  NOT NULL,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  email      VARCHAR(255) NOT NULL UNIQUE,
  address    VARCHAR(255),
  zip        VARCHAR(10), -- 00921-234
  phone      VARCHAR(15), -- +1 787-234-4321
  image_url  VARCHAR(255),
  create_at  DATETIME     NOT NULL DEFAULT NOW(),
  update_at  DATETIME     NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  role_id    INT,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE SET NULL
);

CREATE TABLE property_types (
  id        INT PRIMARY KEY            AUTO_INCREMENT,
  type      VARCHAR(255) NOT NULL, -- commercial, residential
  create_at DATETIME     NOT NULL      DEFAULT NOW(),
  update_at DATETIME     NOT NULL      DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE property_status (
  id        INT PRIMARY KEY            AUTO_INCREMENT,
  status    VARCHAR(255) NOT NULL, -- rent, sell, sold
  create_at DATETIME     NOT NULL      DEFAULT NOW(),
  update_at DATETIME     NOT NULL      DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE properties (
  id                 INT PRIMARY KEY        AUTO_INCREMENT,
  price              DECIMAL(7, 2) NOT NULL DEFAULT 0,
  address            VARCHAR(255)  NOT NULL,
  state              VARCHAR(2)    NOT NULL,
  zip                VARCHAR(10), -- 00921-234
  beds               INT           NOT NULL DEFAULT 0,
  baths              INT           NOT NULL DEFAULT 0,
  year_built         YEAR(4)       NOT NULL,
  heating            VARCHAR(255),
  attic              BOOL,
  appliances         VARCHAR(255),
  flooring           VARCHAR(255),
  heating_type       VARCHAR(255),
  cooling            VARCHAR(255),
  parking            VARCHAR(255),
  parking_type       VARCHAR(255),
  mls                VARCHAR(255),
  sqft               DECIMAL(6, 2)          DEFAULT 0,
  description        TEXT,
  create_at          DATETIME      NOT NULL DEFAULT NOW(),
  update_at          DATETIME      NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  property_type_id   INT,
  property_status_id INT,
  FOREIGN KEY (property_type_id) REFERENCES property_types (id) ON DELETE SET NULL,
  FOREIGN KEY (property_status_id) REFERENCES property_status (id) ON DELETE SET NULL
);

# User can save properties that he likes
CREATE TABLE saved_properties (
  lat         DECIMAL(10, 8) NOT NULL,
  lon         DECIMAL(11, 8) NOT NULL,
  create_at   DATETIME       NOT NULL      DEFAULT NOW(),
  update_at   DATETIME       NOT NULL      DEFAULT NOW() ON UPDATE NOW(),
  user_id     INT            NOT NULL,
  property_id INT            NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (property_id) REFERENCES properties (id),
  PRIMARY KEY (user_id, property_id)
);

# properties have can have multiple images
CREATE TABLE property_images (
  id          INT PRIMARY KEY            AUTO_INCREMENT,
  url         VARCHAR(255) NOT NULL,
  create_at   DATETIME     NOT NULL      DEFAULT NOW(),
  update_at   DATETIME     NOT NULL      DEFAULT NOW() ON UPDATE NOW(),
  property_id INT          NOT NULL,
  FOREIGN KEY (property_id) REFERENCES properties (id)
);

# Save all of the property views from users, or guests?
CREATE TABLE property_views (
  id          INT PRIMARY KEY        AUTO_INCREMENT,
  create_at   DATETIME NOT NULL      DEFAULT NOW(),
  update_at   DATETIME NOT NULL      DEFAULT NOW() ON UPDATE NOW(),
  property_id INT      NOT NULL,
  user_id     INT      NOT NULL,
  FOREIGN KEY (property_id) REFERENCES properties (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
