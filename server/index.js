require('dotenv').config();
const express = require('express');
const path = require('path');
const morgan = require('morgan');
const router = require('./routes');

const app = express();
app.use(express.json());
app.use(express.static(path.join(__dirname, '../client/dist')));
app.use(morgan('dev'));

app.use('/product', router);

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Listening on port http://localhost:${port}/`);
});
