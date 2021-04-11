const { createLogger, format, transports } = require('winston');
const { combine, timestamp, prettyPrint, printf } = format;

const myFormat = printf(({ level, message, timestamp }) => {
  return `${timestamp} ${level}: ${message}`;
});

const logConfig = {
  format: combine(
   timestamp( {format: 'YYYY-MM-DD HH:mm:ss ZZ'}),
   myFormat,
   prettyPrint()
  ),
  transports: [
    new transports.File({
      filename: './logs/combined.log'
    })
  ]
}

const log = createLogger(logConfig);

module.exports = (router, database, weather) => {

  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data);
      });
  });

  router.get('/:id', (req, res) => {
    database.getCity(req.params.id)
      .then(data => {
        const city = data.replace(/\s/, '+');
        return weather.getWeather(city);
      })
      .then(data => {
        database.addWeather(data, req.params.id);
        log.info('API ran')
      })
      .then(data => {
        return database.showWeather(req.params.id);
      })
      .then(data => {
        res.send(data);
      })
      .then(data => {
        return database.getCity(req.params.id);
      })
      .then(data => {
        // Add new info after 20 seconds
        setTimeout(() => {
          return weather.getWeather(data)
            .then(data => {
              database.addWeather(data, req.params.id);
              log.info('API ran')
            });
        }, 20000);
      })
      .catch(err => {
        log.error(err);
      });
  });
};
