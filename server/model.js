const { db } = require('./db');

module.exports = {
  getProduct: (id) => {
    const query = ``;
    const values = [];
    console.log('id:', id);
    return db.query(`SELECT * FROM product WHERE product_id = ${id}`);
  },
};
