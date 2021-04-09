const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg')
require('dotenv').config();

const app = express();

const PORT = process.env.PORT || 8080;
const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: 'localhost',
  database: 'aircanada'
})

app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send("HELLO");
});

app.listen(PORT, () => {
  console.log(`Server started and listening on port ${PORT}`);
});