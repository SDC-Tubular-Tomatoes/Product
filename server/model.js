const { db } = require('./db');

module.exports = {
  getProducts: () => db.query('SELECT * FROM product LIMIT 5'),

  getProduct: (id) => {
    // const query = `SELECT *
    // FROM product
    // JOIN features ON product.product_id = features.product_id
    // WHERE product.product_id = ${id}`;
    const query = `SELECT p.item_name, p.slogan, p.product_description,
    json_agg(json_build_object('feature', f.feature, 'feature_value', f.feature_value)) AS features
FROM product p
JOIN features f ON p.product_id = f.product_id
WHERE p.product_id = ${id}
GROUP BY p.item_name, p.slogan, p.product_description`;
    return db.query(query);
  },
};
