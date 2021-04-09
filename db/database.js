const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: 'localhost',
  database: 'aircanada',
  port: 5432
});

const locations = () => {
  return pool.query(`
  SELECT * FROM locations
  `);
};
exports.locations = locations;