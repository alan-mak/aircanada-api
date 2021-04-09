module.exports = (router, database) => {
  
  router.get('/', (req, res) => {
    database.locations()
    .then((data) => {
      res.send(data.rows)
    })
  });
  
  router.get('/:id', (req, res) => {
    res.send("specific location");
  });
}
  