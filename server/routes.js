const router = require('express').Router();
const controller = require('./controller');

router.get('/', controller.getProducts);
router.get('/:product_id', controller.getProduct);
router.get('/:product_id/related', controller.getProductRelated);
router.get('/:product_id/styles', controller.getStyle);
// router.get('/inventory', controller.getInventory);

module.exports = router;
