DROP TABLE IF EXISTS real.column_header_mapping;

CREATE TABLE real.column_header_mapping AS
WITH
mapped_base AS (
  SELECT
    pheader,
    original_header,
    STRING_TO_ARRAY(country_code, ',') AS country_code,
    STRING_TO_ARRAY(programme_code,',') AS programme_code,
    STRING_TO_ARRAY(table_name,',') AS table_name,
    "mapping"
  FROM raw.column_header_mapping_mapped
),

mapped AS (
  SELECT
    ch.pheader,
    ch.original_header,
    ch.country_code,
    ch.programme_code,
    ch.table_name,
    mm."mapping"
  FROM raw.column_header_mapping AS ch
  LEFT JOIN mapped_base AS mm ON ch.pheader = mm.pheader
    AND ch.original_header = mm.original_header
    AND (ch.country_code = ANY(mm.country_code)
    AND ch.programme_code = ANY (mm.programme_code)
    AND ch.table_name = ANY (mm.table_name))
    AND mm."mapping" IS NOT NULL
),

missing_names AS (
  SELECT
    pheader,
    original_header,
    country_code,
    programme_code,
    table_name,
    "mapping"
  FROM mapped
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
    "mapping"
  FROM mapped
  WHERE pheader NOT LIKE '%missing_column_name_%'
    AND pheader NOT LIKE '%none_%'
  GROUP BY pheader, "mapping"
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