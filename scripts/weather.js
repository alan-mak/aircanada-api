const axios = require('axios');

const getWeather = (city) => {
  return axios
    .get(`https://api.openweathermap.org/data/2.5/weather?q=Toronto&appid=${process.env.OPEN_WEATHER_API}&units=metric`)
    .then(res => {
      return res.data
    })
    .catch(err => {
      console.log(err)
    })
}

exports.getWeather = getWeather