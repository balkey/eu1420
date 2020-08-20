WITH
base AS (
  SELECT
    *,
    CASE
      WHEN date_of_last_update IS NOT NULL THEN 1
      ELSE 0
    END AS column_presence
  FROM real.operations_eu
)

SELECT
  operation_nuts0,
  COUNT(*) AS operation_count,
  SUM(column_presence) AS date_of_last_update_present,
  ROUND((SUM(column_presence)*1.0 / COUNT(*))*100.0,2) AS percentage
FROM base
GROUP BY 1
ORDER BY 1;