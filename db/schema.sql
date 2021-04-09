DROP TABLE IF EXISTS locations CASCADES;
DROP TABLE IF EXISTS weathers CASCADES;

CREATE TABLE locations (
  id SERIAL PRIMARY KEY NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE weathers (
  id SERIAL PRIMARY KEY NOT NULL,
  lon FLOAT,
  lat FLOAT,
  temp FLOAT,
  feels_like FLOAT,
  temp_min FLOAT,
  temp_max FLOAT,
  pressure INTEGER,
  humidity INTEGER,
  visibility INTEGER,
  wind_speed FLOAT,
  wind_deg INTEGER
);