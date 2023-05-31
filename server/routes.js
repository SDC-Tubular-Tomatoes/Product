const router = require('express').Router();
const controller = require('./controller');

router.get('/products', controller.getProducts);
router.get('/products/:product_id', controller.getProduct);
router.get('/products/:product_id/related', controller.getProductRelated);
router.get('/products/:product_id/styles', controller.getStyle);
// router.get('/inventory', controller.getInventory);

module.exports = router;
