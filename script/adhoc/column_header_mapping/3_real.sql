DROP TABLE IF EXISTS real.column_header_mapping;

CREATE TABLE real.column_header_mapping AS
WITH
missing_names AS (
  SELECT
    pheader,
    original_header,
    country_code,
    programme_code,
    table_name,
    NULL::TEXT AS mapping
  FROM raw.column_header_mapping
  WHERE pheader LIKE '%missing_column_name_%'
    OR pheader LIKE '%none_%'
),

declared_names AS (
  SELECT
    pheader,
    STRING_AGG(DISTINCT original_header,',') AS original_header,
    STRING_AGG(DISTINCT country_code,',') AS country_code,
    STRING_AGG(programme_code,',') AS programme_code,
    STRING_AGG(table_name,',') AS table_name,
    NULL::TEXT AS mapping
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