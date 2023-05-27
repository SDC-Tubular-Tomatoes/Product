require('dotenv').config();
const pgp = require('pg-promise')();

const connection = {
  host: process.env.DB_HOST,
  port: process.env.SQL_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
};

const db = pgp(connection);

db.connect()
  .then(() => console.log('Connected to the database'))
  .catch((err) => console.log('Failed to connect to the database', err));

module.exports.db = db;
