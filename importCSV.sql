\COPY product(product_id, item_name, slogan, product_description, category, default_price) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/product.csv' DELIMITER ',' CSV HEADER;

\COPY relateditems(id, product_id, related_id) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/related.csv' DELIMITER ',' CSV HEADER;

\COPY features(id, product_id, feature, feature_value) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/features.csv' DELIMITER ',' CSV HEADER;

\COPY styles(id, product_id, style_name, sale_price, original_price, default_style) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/styles.csv' DELIMITER ',' CSV HEADER;

\COPY photos(id, style_id, pic_url, thumbnail_url) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/photos.csv' DELIMITER ',' CSV HEADER;

\COPY inventory(id, style_id, size, quantity) FROM '/Users/ray/Desktop/HackReactor/SDC Application Data Sets/ProductsData/skus.csv' DELIMITER ',' CSV HEADER;
