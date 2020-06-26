WITH
nr_of_rows AS (
  SELECT
    schemaname,
    relname AS table_name,
    n_live_tup AS nr_of_rows
  FROM pg_stat_user_tables
  WHERE relname NOT IN ('header_detected_1', 'header_detected_2', 'source_master')
  AND schemaname = 'raw'
)

SELECT
  SUBSTRING(table_name,5,2) AS country_code,
  COUNT(*) AS nr_of_files,
  SUM(nr_of_rows) AS nr_of_rows
FROM nr_of_rows
GROUP BY 1
ORDER BY 1;