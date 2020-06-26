WITH
native_columns AS (
  SELECT
    COLUMN_NAME AS column_name,
    ARRAY_AGG(table_name ORDER By table_name) AS "tables"
  FROM information_schema.columns
  WHERE table_schema = 'raw'
    AND table_name NOT IN ('header_detected_1', 'header_detected_2', 'source_master')
  GROUP BY 1
)

SELECT
  *
FROM native_columns
ORDER BY 2,1;