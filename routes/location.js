
module.exports = (router, database, weather) => {

  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data);
      });
  });

  router.get('/:id', (req, res) => {
    //Get Weather of ID
    //Show weather of specific id page
    database.showWeather(req.params.id)
      .then(data => {
        if (!data.length) {
          res.send("No Data Yet... Wait 20 seconds")
        } else {
          res.send(data)
        }
      })
      .then((data) => {
        return weather.getWeather();
      })
      .then((data) => {
        database.addWeather(data);
      })
      .catch(err => {
        console.log(err);
      });
  });
};
