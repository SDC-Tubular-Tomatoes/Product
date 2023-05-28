const models = require('./model');

module.exports = {
  getProducts: (req, res) => {
    models.getProducts()
      .then((response) => {
        res.send(response);
      })
      .catch((err) => {
        console.log('Unable to get products: ', err);
        res.sendStatus(500);
      });
  },
  getProduct: (req, res) => {
    models.getProduct(req.params.product_id)
      .then((response) => {
        res.send(response);
      })
      .catch((err) => {
        console.log('Unable to get product: ', err);
        res.sendStatus(500);
      });
  },
  getStyle: (req, res) => {
    models.getProductStyle(req.params.product_id)
      .then((response) => {
        res.send(response);
      })
      .catch((err) => {
        console.log('Unable to get product: ', err);
        res.sendStatus(500);
      });
  },
  getProductRelated: (req, res) => {
    models.getProductRelated(req.params.product_id)
      .then((response) => {
        res.send(response);
      })
      .catch((err) => {
        console.log('Unable to get related product ids: ', err);
        res.sendStatus(500);
      });
  },
  // getInventory: (req, res) => {
  //   res.send('Reached controller');
  // },
};
