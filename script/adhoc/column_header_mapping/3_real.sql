DROP TABLE IF EXISTS real.column_header_mapping;

CREATE TABLE real.column_header_mapping AS
WITH
missing_names AS (
  SELECT
    pheader,
    ARRAY[original_header] AS original_header,
    ARRAY[country_code] AS country_code,
    ARRAY[programme_code] AS programme_code,
    ARRAY[table_name] AS table_name
  FROM raw.column_header_mapping
  WHERE pheader LIKE '%missing_column_name_%'
    OR pheader LIKE '%none_%'
),

declared_names AS (
  SELECT
    pheader,
    ARRAY_AGG(original_header) AS original_header,
    ARRAY_AGG(DISTINCT country_code) AS country_code,
    ARRAY_AGG(programme_code) AS programme_code,
    ARRAY_AGG(table_name) AS table_name
  FROM raw.column_header_mapping
  WHERE pheader NOT LIKE '%missing_column_name_%'
    AND pheader NOT LIKE '%none_%'
  GROUP BY 1
),

merged AS (
  SELECT * FROM missing_names
  UNION ALL
  SELECT * FROM declared_names
)

SELECT
  *
FROM merged
ORDER BY 1;

\copy (SELECT * FROM real.column_header_mapping) TO 'data/adhoc/real_column_header_mapping.csv' DELIMITER ',' CSV HEADER;