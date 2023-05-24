const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/test');

const products = mongoose.Schema({
  id: Number,
});

const relatedItems = mongoose.Schema({
  relatedIDs: Array,
});

const product = mongoose.Schema({
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: Number,
  Features: Array,
});

const styles = mongoose.Schema({
  style_name: String,
  sale_price: Number,
  photos: Array,
});

const ProductsModel = mongoose.model('products', products);
const RelatedModel = mongoose.model('relatedItems', relatedItems);
const ProductModel = mongoose.model('product', product);
const StylesModel = mongoose.model('styles', styles);

module.exports.ProductsModel = ProductsModel;
module.exports.RelatedModel = RelatedModel;
module.exports ProductModel = ProductModel;
module.exports.StylesModel = StylesModel;
