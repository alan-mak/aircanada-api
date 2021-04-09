module.exports = (router, database, weather) => {
  
  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data.rows);
      });
  });
  
  router.get('/:id', (req, res) => {
    weather.getWeather()
    .then((response) => {
      res.send(response.data)
      database.addWeather(response.data)
    })
  });
};
  