WITH
base AS (
  SELECT
    *,
    ROW_NUMBER () OVER (PARTITION BY country ORDER BY endpoint NULLS LAST) AS row_num 
  FROM raw.source_master
)

SELECT
  country,
  reference,
  --"name",
  --list_of_operations_url,
  --download_url_plus_readable_format,
  --supervised_download_url,
  endpoint,
  "access",
  --anchor_text,
  --last_update,
  fileformat,
  compressed
FROM base
WHERE row_num = 1;
