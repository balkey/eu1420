WITH
nr_of_columns AS (
  SELECT
    table_name,
    COLUMN_NAME AS column_name
  FROM information_schema.columns
  WHERE table_schema = 'raw'
    AND table_name NOT IN ('header_detected_1', 'header_detected_2', 'source_master')
)

SELECT
  SUBSTRING(table_name, 5,2) AS country,
  SPLIT_PART(table_name,'_',1) AS programme_code,
  SPLIT_PART(table_name,'_',2) AS file_sheet_index,
  *
FROM nr_of_columns
ORDER BY 1,2,3,4,5;
