const { Pool } = require('pg');
const { exec } = require('child_process');

const { createLogger, format, transports } = require('winston');
const { combine, timestamp, prettyPrint, printf } = format;

const myFormat = printf(({ level, message, timestamp }) => {
  return `${timestamp} ${level}: ${message}`;
});

const logConfig = {
  format: combine(
    timestamp({format: 'YYYY-MM-DD HH:mm:ss ZZ'}),
    myFormat,
    prettyPrint()
  ),
  transports: [
    new transports.File({
      filename: './logs/combined.log'
    })
  ]
};

const log = createLogger(logConfig);

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  database: process.env.DB,
  port: process.env.DB_PORT
});

const locations = () => {
  return pool.query(`
  SELECT * FROM locations;
  `)
    .then(res => {
      return res.rows;
    })
    .catch(err => {
      log.error(err);
    });
};
exports.locations = locations;

const getCity = (id) => {
  return pool.query(`
  SELECT city FROM locations
  WHERE id = ${id};
  `)
    .then(data => {
      return (data.rows[0].city);
    })
    .catch(err => {
      log.error(err);
    });
};
exports.getCity = getCity;

const addWeather = (data, id) => {
  backup();
  return pool.query(`
  INSERT INTO weathers (lon, lat, temp, feels_like, temp_min, temp_max, pressure, humidity, visibility, wind_speed, wind_deg, last_update, location_id)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, NOW(), $12);
  `, [data.coord.lon, data.coord.lat, data.main.temp, data.main.feels_like, data.main.temp_min, data.main.temp_max, data.main.pressure, data.main.humidity, data.visibility, data.wind.speed, data.wind.deg, id])
    .catch(err => {
      log.error(err);
    });
};
exports.addWeather = addWeather;

const showWeather = (id) => {
  return pool.query(`
  SELECT * FROM weathers
  WHERE location_id = $1
  ORDER BY last_update DESC LIMIT 1;
  `, [id])
    .then(res => {
      return res.rows;
    })
    .catch(err => {
      log.error(err);
    });
};
exports.showWeather = showWeather;

const backup = () => {
  exec(`pg_dump -p ${process.env.DB_PORT} -d ${process.env.DB} > db_backup.sql`);
};
exports.backup = backup;