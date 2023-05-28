const { db } = require('./db');

module.exports = {
  getProducts: () => db.query('SELECT * FROM product LIMIT 5'),

  getProduct: (id) => {
    const query = `SELECT p.item_name, p.slogan, p.product_description,
    json_agg(json_build_object('feature', f.feature, 'feature_value', f.feature_value)) AS features
      FROM product p
      JOIN features f ON p.product_id = f.product_id
      WHERE p.product_id = ${id}
      GROUP BY p.item_name, p.slogan, p.product_description`;
    return db.query(query);
  },

  getProductStyle: (id) => {
    const query = `SELECT s.product_id, s.style_name, s.sale_price, s.original_price, s.default_style,
    json_agg(json_build_object('pic_url', p.pic_url, 'thumbail_url', p.thumbnail_url)) AS photos
      FROM styles s
      JOIN photos p ON s.id = p.style_id
      WHERE s.product_id = ${id}
      GROUP BY s.product_id, s.style_name, s.sale_price, s.original_price, s.default_style`;
    return db.query(query);
  },

  getProductRelated: (id) => {
    // const results = [];
    const query = `SELECT related_id FROM relateditems ri WHERE product_id = ${id}`;
    const response = db.query(query);
    return response;
    // response.rows.map((item) => results.push(item.related_id));
  },
};
