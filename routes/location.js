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
            });
        }, 20000);
      })
      .catch(err => {
        console.log(err);
      });
  });
};
