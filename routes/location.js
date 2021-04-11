
module.exports = (router, database, weather) => {

  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data);
      });
  });

  router.get('/:id', (req, res) => {
    //Show weather of specific id page
    database.showWeather(req.params.id)
      .then(data => {
        if (!data.length) {
          res.send("No Past Call... Wait 20 seconds then refresh")
        } else {
          res.send(data)
        }
      })
      .then(data => {
        return database.getCity(req.params.id);
      })
      .then((data) => {
        const city = data.replace(/\s/, '+')
        return weather.getWeather(city);
      })
      .then((data) => {
        setTimeout(() => {
          database.backup()
          //Get Weather of ID
          database.addWeather(data, req.params.id)
        }, 1000);
      })
      .catch(err => {
        console.log(err);
      });
  });
};
