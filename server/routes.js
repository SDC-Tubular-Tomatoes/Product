const router = require('express').Router();
const controller = require('./controller');

router.get('/', controller.getProducts);
router.get('/:product_id', controller.getProduct);
// router.get('/styles', controller.getStyle);
// router.get('/photos', controller.getPhotos);
// router.get('/inventory', controller.getInventory);

module.exports = router;
