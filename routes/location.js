module.exports = (router, database, weather) => {
  
  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data);
      });
  });
  
  router.get('/:id', (req, res) => {
    weather.getWeather()
    .then((data) => {
      res.send(data)
      database.addWeather(data)
    })
    .catch(err => {
      console.log(err)
    })
  });
};
  