DROP DATABASE IF EXISTS products_database;
CREATE DATABASE products_database;

DROP TABLE IF EXISTS features;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS relateditems;
DROP TABLE IF EXISTS styles;
DROP TABLE IF EXISTS product;

CREATE INDEX idx_product_product_id ON product (product_id);

CREATE INDEX idx_relateditems_product_id ON relateditems (product_id);

CREATE INDEX idx_features_product_id ON features (product_id);

CREATE INDEX idx_styles_product_id ON styles (product_id);

CREATE INDEX idx_photos_style_id ON photos (style_id);

CREATE INDEX idx_iventory_style_id ON inventory (style_id);

CREATE TABLE product (
  product_id SERIAL PRIMARY KEY NOT NULL,
  item_name VARCHAR(30) NOT NULL,
  slogan VARCHAR(255) NOT NULL,
  product_description TEXT NOT NULL,
  category VARCHAR(20) NOT NULL,
  default_price INT NOT NULL
);

CREATE TABLE relateditems (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  related_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE features (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  feature VARCHAR(30) NOT NULL,
  feature_value VARCHAR(30) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE styles (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  style_name VARCHAR(50),
  sale_price VARCHAR(4),
  original_price INT NOT NULL,
  default_style BOOLEAN NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY NOT NULL,
  style_id INT NOT NULL,
  pic_url VARCHAR(250) NOT NULL,
  thumbnail_url TEXT NOT NULL,
    FOREIGN KEY (style_id) REFERENCES styles (id)
);

CREATE TABLE inventory (
  id SERIAL PRIMARY KEY NOT NULL,
  style_id INT NOT NULL,
  size VARCHAR(10) NOT NULL,
  quantity INT NOT NULL,
    FOREIGN KEY (style_id) REFERENCES styles (id)
);



/***                                CSV COMMANDS                               ***/

-- \COPY product(product_id, item_name, slogan, product_description, category, default_price) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/product.csv' DELIMITER ',' CSV HEADER;

-- \COPY relateditems(id, product_id, related_id) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/related.csv' DELIMITER ',' CSV HEADER;

-- \COPY features(id, product_id, feature, feature_value) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/features.csv' DELIMITER ',' CSV HEADER;

-- \COPY styles(id, product_id, style_name, sale_price, original_price, default_style) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/styles.csv' DELIMITER ',' CSV HEADER;

-- \COPY photos(id, style_id, pic_url, thumbnail_url) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/photos.csv' DELIMITER ',' CSV HEADER;

-- \COPY inventory(id, style_id, size, quantity) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/skus.csv' DELIMITER ',' CSV HEADER;
