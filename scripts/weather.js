const axios = require('axios');

const getWeather = async () => {
  return axios.get('https://api.openweathermap.org/data/2.5/weather?q=Toronto&appid=104e894c3d27b29099995a9cbe3eeb55&units=metric'
  )
    .catch(err => {
      console.log(err)
    })
}

exports.getWeather = getWeather