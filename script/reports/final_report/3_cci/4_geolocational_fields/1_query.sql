WITH
base AS (
  SELECT
    *,
    CASE
      WHEN operation_nuts1_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts1_code_present,
    CASE
      WHEN operation_nuts1_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts1_name_present,
    CASE
      WHEN operation_nuts2_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts2_code_present,
    CASE
      WHEN operation_nuts2_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts2_name_present,
    CASE
      WHEN operation_nuts3_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts3_code_present,
    CASE
      WHEN operation_nuts3_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_nuts3_name_present,
    CASE
      WHEN operation_lau1_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_lau1_code_present,
    CASE
      WHEN operation_lau1_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_lau1_name_present,
    CASE
      WHEN operation_lau2_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_lau2_code_present,
    CASE
      WHEN operation_lau2_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_lau2_name_present,
    CASE
      WHEN operation_city IS NOT NULL THEN 1
      ELSE 0
    END AS operation_city_present,
    CASE
      WHEN operation_district IS NOT NULL THEN 1
      ELSE 0
    END AS operation_district_present,
    CASE
      WHEN operation_zip_code IS NOT NULL THEN 1
      ELSE 0
    END AS operation_zip_code_present
  FROM real.operations_eu
),

merged AS (
  SELECT
    cci,
    'operation_nuts1_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts1_code_present) AS present,
    ROUND((SUM(operation_nuts1_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_nuts1_name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts1_name_present) AS present,
    ROUND((SUM(operation_nuts1_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_nuts2_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts2_code_present) AS present,
    ROUND((SUM(operation_nuts2_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_nuts2_name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts2_name_present) AS present,
    ROUND((SUM(operation_nuts2_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_nuts3_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts3_code_present) AS present,
    ROUND((SUM(operation_nuts3_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_nuts3_name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts3_name_present) AS present,
    ROUND((SUM(operation_nuts3_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_lau1_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau1_code_present) AS present,
    ROUND((SUM(operation_lau1_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_lau1_name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau1_name_present) AS present,
    ROUND((SUM(operation_lau1_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_lau2_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau2_code_present) AS present,
    ROUND((SUM(operation_lau2_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_lau2_name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau2_name_present) AS present,
    ROUND((SUM(operation_lau2_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_city' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_city_present) AS present,
    ROUND((SUM(operation_city_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_district' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_district_present) AS present,
    ROUND((SUM(operation_district_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    cci,
    'operation_zip_code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_zip_code_present) AS present,
    ROUND((SUM(operation_zip_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
),

vw AS (
  SELECT
    m.cci,
    COALESCE(c.programme_title,(m.cci||' (CCI code / programme title unretrievable)')) AS programme_title,
    m.geolocation_type,
    m.operation_count,
    m.present,
    m.percentage
  FROM merged AS m
  LEFT JOIN real.cci_codes AS c ON m.cci = c.cci_code
)

SELECT
  programme_title,
  geolocation_type,
  operation_count,
  present,
  percentage
FROM vw
WHERE present > 0
ORDER BY cci, geolocation_type;
