DROP DATABASE IF EXISTS products_database;
CREATE DATABASE products_database;

DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS relateditems;
DROP TABLE IF EXISTS styles;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS features;

CREATE TABLE product (
  product_id SERIAL PRIMARY KEY NOT NULL,
  item_name VARCHAR(30) NOT NULL,
  slogan VARCHAR(100) NOT NULL,
  product_description TEXT NOT NULL,
  category VARCHAR(20) NOT NULL,
  default_price INT NOT NULL,
);

CREATE TABLE relateditems (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  related_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE styles (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  style_name VARCHAR(10),
  sale_price INT NOT NULL,
  original_price INT NOT NULL,
  default_style BOOLEAN NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY NOT NULL,
  style_id INT NOT NULL,
  pic_url VARCHAR(200) NOT NULL,
  thumbnail_url VARCHAR(200) NOT NULL,
    FOREIGN KEY (style_id) REFERENCES styles (id)
);

CREATE TABLE inventory (
  id SERIAL PRIMARY KEY NOT NULL,
  style_id INT NOT NULL,
  size CHAR(3) NOT NULL,
  quantity INT NOT NULL,
    FOREIGN KEY (style_id) REFERENCES styles (id)
);

CREATE TABLE features (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  feature VARCHAR(30) NOT NULL,
  feature_value VARCHAR(30) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id)
);