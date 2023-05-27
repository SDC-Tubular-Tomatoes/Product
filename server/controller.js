const models = require('./model');

module.exports = {
  getProduct: (req, res) => {
    models.getProduct(req.params.product_id)
      .then((response) => {
        res.send(response);
      });
    // console.log('request: ', req);
  },
  // getStyle: (req, res) => {
  //   res.send('Reached controller');
  // },
  // getPhotos: (req, res) => {
  //   res.send('Reached controller');
  // },
  // getFeatures: (req, res) => {
  //   res.send('Reached controller');
  // },
  // getInventory: (req, res) => {
  //   res.send('Reached controller');
  // },
};
