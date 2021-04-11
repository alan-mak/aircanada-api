# Air Canada Assessment

An api used to collect weather data.

## Introduction
For this project a NodeJS API was created. The database used was PostgreSQL. The tasks that this project completed were:

* Create a NodeJS API to fetch weather details for a given City using OpenWeather API
* API  will accept city name and read from DB table
* NodeJS will fetch encrypted Key Secrets from configuration file for authenticating OpenWeather API
* NodeJS API will call OpenWeather API to get latest weather information and dump this info in DB Table 
* Return weather details in 20 seconds of last call for the same City, API will respond with DB Table dump, post 20 seconds it will go to OpenWeather API to get latest weather
* Write Unit Test cases on API.
* Log the API execution in Log files with Date stamp.

You can contact me at mak_alan@icloud.com for any questions, comments and improvements.

## Setup
1. Install dependencies with `npm install`
2. Create database and run `schema.sql` and `seeds.sql`
3. Create a `.env` file using the `.env.example` and input your own OpenWeather API Key
4. Start the server with `npm start`
5. Test with `npm test`

## Usage
* To access the cities available for weather collection use `http://localhost:3000/locations/` for their IDs
* To call the city's weather to update use `http://localhost:3000/locations/:id` where `:id` would be the ID number from the path before
* API and Error logs are available in the `logs` folder

## Tech Stack
* NodeJS
* PostgreSQL
* Mocha and Chai