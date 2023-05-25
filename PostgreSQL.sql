DROP DATABASE IF EXISTS products_database;
CREATE DATABASE products_database;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS relateditems;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS styles;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS inventory;

CREATE TABLE products (
  product_id INT PRIMARY KEY NOT NULL
);

CREATE TABLE relateditems (
  product_id SERIAL PRIMARY KEY NOT NULL,
  related_ids INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE product (
  product_id SERIAL PRIMARY KEY NOT NULL,
  item_name VARCHAR(30) NOT NULL,
  slogan VARCHAR(100) NOT NULL,
  product_description TEXT NOT NULL,
  category VARCHAR(20) NOT NULL,
  default_price INT NOT NULL,
  features VARCHAR(50)[] NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE styles (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  style_id INT NOT NULL,
  style_name VARCHAR(10),
  sale_price INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE photos (
  photo_id SERIAL PRIMARY KEY NOT NULL,
  pic_url VARCHAR(200) NOT NULL,
  thumbnail VARCHAR(200) NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES styles (id)
);

CREATE TABLE inventory (
  sku_id SERIAL PRIMARY KEY NOT NULL,
  quantity INT NOT NULL,
  size CHAR(3) NOT NULL,
    FOREIGN KEY (sku_id) REFERENCES styles (id)
);

