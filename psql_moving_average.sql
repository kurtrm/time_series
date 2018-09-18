SELECT
  id,
  extract('hour' FROM date),
  AVG(ambient_temp)
  OVER(ORDER BY
        date_trunc('hour', date)
        ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING)
FROM time_series;

# Same as pd.Series.rolling(window=7,
#                           center=True,
#                           min_period=0)