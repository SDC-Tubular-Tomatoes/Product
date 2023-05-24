DROP DATABASE IF EXISTS productsdb;
CREATE DATABASE productsdb;

USE productsdb;

CREATE TABLE products (
  product_id int PRIMARY KEY
)

CREATE TABLE relateditems (
  product_id int AUTO_INCREMENT PRIMARY KEY,
  related_ids array,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
)

CREATE TABLE product (
  product_id int AUTO_INCREMENT PRIMARY KEY,
  item_name varchar(30),
  slogan varchar(100),
  description text,
  category varchar(20),
  default_price int,
  features array,
    FOREIGN KEY (product_id) REFERENCES products (product_id)

)

CREATE TABLE styles (
  product_id int AUTO_INCREMENT PRIMARY KEY,
  style_id int,
  style_name varchar(10),
  sale_prce int,
  photo_id int AUTO_INCREMENT,
  sku_id int,
    FOREIGN KEY (product_id) REFERENCES products (product_id)

)

CREATE TABLE photos (
  photo_id int AUTO_INCREMENT PRIMARY KEY,
  url varchar(200),
  thumbnail varchar(200),
    FOREIGN KEY (photo_id) REFERENCES styles (photo_id)
)

CREATE TABLE inventory (
  sku_id int PRIMARY KEY,
  quantity int,
  size char(3),
    FOREIGN KEY (sku_id) REFERENCES styles (sku_id)
)
