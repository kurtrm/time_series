DROP FUNCTION rolling_mean();

CREATE OR REPLACE FUNCTION rolling_mean()
 RETURNS TABLE (
 eq_time TIMESTAMP,
 eq_mean NUMERIC
)
AS $$
BEGIN
  RETURN QUERY SELECT
    date_trunc('hour', Date) as hour,
    avg(ambient_temp)
    OVER(order by date_trunc('hour', Date))
  FROM
    time_series;
END;
$$ LANGUAGE 'plpgsql';