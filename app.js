const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();

const locations = require('./routes/location');
const database = require('./db/database');
const weather = require('./scripts/weather');

const PORT = process.env.PORT || 8080;


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const locationRoute = express.Router();
locations(locationRoute, database, weather);
app.use('/locations', locationRoute);

app.get('/', (req, res) => {
  res.redirect("/locations");
});


app.listen(PORT, () => {
  console.log(`Server started and listening on port ${PORT}`);
});