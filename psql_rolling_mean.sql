DROP FUNCTION rolling_mean();
DROP FUNCTIOn rolling_sum();

CREATE OR REPLACE FUNCTION rolling_mean()
 RETURNS TABLE (
 eq_time TIMESTAMP,
 eq_mean NUMERIC
)
AS $$
BEGIN
  RETURN QUERY SELECT
    date_trunc('hour', Date) as hour,
    AVG(ambient_temp)
    OVER(order by date_trunc('hour', Date))
  FROM
    time_series;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION rolling_sum()
 RETURNS TABLE (
 eq_time TIMESTAMP,
 eq_mean BIGINT
)
AS $$
BEGIN
  RETURN QUERY SELECT
    date_trunc('hour', Date) as hour,
    SUM(packing_leakage_rate)
    OVER(order by date_trunc('hour', Date))
  FROM
    time_series;
END;
$$ LANGUAGE 'plpgsql';