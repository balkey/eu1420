WITH
base AS (
  SELECT
    *,
    CASE
      WHEN operation_location IS NOT NULL THEN 1
      ELSE 0
    END AS column_presence
  FROM real.operations_eu
)

SELECT
  operation_nuts0,
  COUNT(*) AS operation_count,
  SUM(column_presence) AS operation_location_present,
  ROUND((SUM(column_presence)*1.0 / COUNT(*))*100.0,2) AS percentage
FROM base
GROUP BY 1
ORDER BY 1;