SELECT
  date_trunc('day', Date) AS day,
  AVG(ambient_temp)
FROM
  time_series
GROUP BY
  date_trunc('day', Date)
ORDER BY
  date_trunc('day', Date);


# Rolling average, by hour

SELECT
  date_trunc('hour', Date) as hour,
  avg(ambient_temp)
  OVER(order by date_trunc('hour', Date))
FROM
  time_series;
