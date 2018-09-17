DROP TABLE IF EXISTS time_series;

CREATE TABLE time_series
(
  id serial NOT NULL,
  date TIMESTAMP,
  ambient_temp SMALLINT,
  ambient_humidity SMALLINT,
  discharge_pressure SMALLINT,
  suction_pressure SMALLINT,
  differential_pressure SMALLINT,
  rotor_temperature SMALLINT,
  packing_leakage_rate SMALLINT,
  axial_bearing_temp SMALLINT,
  horizontal_bearing_temp SMALLINT,
  frequency SMALLINT,
  noise SMALLINT,
  voltage SMALLINT,
  current SMALLINT,
  speed SMALLINT,
  system_pressure SMALLINT,
  suction_fluid_temperature SMALLINT,
  discharge_fluid_temp SMALLINT
);

COPY time_series(
  id,
  date,
  ambient_temp,
  ambient_humidity,
  discharge_pressure,
  suction_pressure,
  differential_pressure,
  rotor_temperature,
  packing_leakage_rate,
  axial_bearing_temp,
  horizontal_bearing_temp,
  frequency,
  noise,
  voltage,
  current,
  speed,
  system_pressure,
  suction_fluid_temperature,
  discharge_fluid_temp
)
FROM '/mnt/c/Users/kurtrm/projects/time_series/time_series_psql.csv' CSV HEADER;