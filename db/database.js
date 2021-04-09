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

const addWeather = (data) => {
  return pool.query(`
  INSERT INTO weathers (lon, lat, temp, feels_like, temp_min, temp_max, pressure, humidity, visibility, wind_speed, wind_deg)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
  `, [data.coord.lon, data.coord.lat, data.main.temp, data.main.feels_like, data.main.temp_min, data.main.temp_max, data.main.pressure, data.main.humidity, data.visibility, data.wind.speed, data.wind.deg]);
};
exports.addWeather = addWeather;

