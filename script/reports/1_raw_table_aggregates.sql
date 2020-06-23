WITH
nr_of_columns AS (
  SELECT
    table_name,
    COUNT(COLUMN_NAME) AS nr_of_columns
  FROM information_schema.columns
  WHERE table_schema = 'raw'
  GROUP BY table_name
),

nr_of_rows AS (
  SELECT
    schemaname,
    relname AS table_name,
    n_live_tup AS nr_of_rows
  FROM pg_stat_user_tables 
),

vw AS (
  SELECT
    c.table_name,
    c.nr_of_columns,
    r.nr_of_rows
  FROM nr_of_columns AS c
  LEFT JOIN nr_of_rows AS r ON c.table_name = r.table_name
)

SELECT
  *
FROM vw
ORDER BY 3 DESC;
