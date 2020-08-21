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

vw AS (
  SELECT
    'NUTS1 code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts1_code_present) AS present,
    ROUND((SUM(operation_nuts1_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'NUTS1 name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts1_name_present) AS present,
    ROUND((SUM(operation_nuts1_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'NUTS2 code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts2_code_present) AS present,
    ROUND((SUM(operation_nuts2_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'NUTS2 name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts2_name_present) AS present,
    ROUND((SUM(operation_nuts2_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'NUTS3 code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts3_code_present) AS present,
    ROUND((SUM(operation_nuts3_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'NUTS3 name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_nuts3_name_present) AS present,
    ROUND((SUM(operation_nuts3_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'LAU1 code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau1_code_present) AS present,
    ROUND((SUM(operation_lau1_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'LAU1 name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau1_name_present) AS present,
    ROUND((SUM(operation_lau1_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'LAU2 code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau2_code_present) AS present,
    ROUND((SUM(operation_lau2_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'LAU2 name' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_lau2_name_present) AS present,
    ROUND((SUM(operation_lau2_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'City' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_city_present) AS present,
    ROUND((SUM(operation_city_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'District' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_district_present) AS present,
    ROUND((SUM(operation_district_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Postal code' AS geolocation_type,
    COUNT(*) AS operation_count,
    SUM(operation_zip_code_present) AS present,
    ROUND((SUM(operation_zip_code_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
)

SELECT
  *
FROM vw
ORDER BY
CASE
  WHEN geolocation_type = 'NUTS1 code' THEN 1
  WHEN geolocation_type = 'NUTS1 name' THEN 2
  WHEN geolocation_type = 'NUTS2 code' THEN 3
  WHEN geolocation_type = 'NUTS2 name' THEN 4
  WHEN geolocation_type = 'NUTS3 code' THEN 5
  WHEN geolocation_type = 'NUTS3 name' THEN 6
  WHEN geolocation_type = 'LAU1 code' THEN 7
  WHEN geolocation_type = 'LAU1 name' THEN 8
  WHEN geolocation_type = 'LAU2 code' THEN 9
  WHEN geolocation_type = 'LAU2 name' THEN 10
  WHEN geolocation_type = 'City' THEN 11
  WHEN geolocation_type = 'District' THEN 12
  WHEN geolocation_type = 'Postal code' THEN 13
END;