DROP TABLE IF EXISTS real.source_master;

CREATE TABLE real.source_master AS 
WITH
base AS (
  SELECT
  country,
  SUBSTRING(reference,1,6) AS reference_base,
  endpoint,
  fileformat,
  ARRAY_AGG(reference) AS reference_array,
  ARRAY_AGG("access") AS "access",
  ARRAY_AGG(compressed) AS compressed
  FROM raw.source_master
  GROUP BY 1,2,3,4
)

SELECT
  country,
  CASE
    WHEN ARRAY_LENGTH(reference_array,1) = 1 THEN reference_array[1]
    ELSE reference_base
  END AS reference,
  reference_array,
  endpoint,
  fileformat,
  compressed[1]
FROM base
--WHERE 'online' = ANY("access")
ORDER BY country, reference;