module.exports = (router, database, weather) => {
  
  router.get('/', (req, res) => {
    database.locations()
      .then((data) => {
        res.send(data);
      });
  });
  
  router.get('/:id', (req, res) => {
    //Get Weather of ID
    weather.getWeather()
      .then((data) => {
        database.addWeather(data);
      })
      .catch(err => {
        console.log(err);
      });

    //Show weather of specific id page
    database.showWeather(req.params.id)
      .then(data => {
        res.send(data);
      });
  });
};
  