WITH
base AS (
  SELECT
    *,
    CASE
      WHEN operation_name IS NOT NULL THEN 1
      ELSE 0
    END AS operation_name_present,
    CASE
      WHEN beneficiary_name IS NOT NULL THEN 1
      ELSE 0
    END AS beneficiary_name_present,
    CASE
      WHEN operation_summary IS NOT NULL THEN 1
      ELSE 0
    END AS operation_summary_present,
    CASE
      WHEN operation_start_date IS NOT NULL THEN 1
      ELSE 0
    END AS operation_start_date_present,
    CASE
      WHEN operation_end_date IS NOT NULL THEN 1
      ELSE 0
    END AS operation_end_date_present,
    CASE
      WHEN operation_total_expenditure IS NOT NULL THEN 1
      ELSE 0
    END AS operation_total_expenditure_present,
    CASE
      WHEN eu_cofinancing_rate IS NOT NULL THEN 1
      ELSE 0
    END AS eu_cofinancing_rate_present,
    CASE
      WHEN country IS NOT NULL THEN 1
      ELSE 0
    END AS country_present,
    CASE
      WHEN operation_location IS NOT NULL THEN 1
      ELSE 0
    END AS operation_location_present,
    CASE
      WHEN COALESCE(name_of_category_intervention,code_of_category_intervention) IS NOT NULL THEN 1
      ELSE 0
    END AS name_of_category_intervention_present,
    CASE
      WHEN date_of_last_update IS NOT NULL THEN 1
      ELSE 0
    END AS date_of_last_update_present
  FROM real.operations_eu
),

vw AS (
  SELECT
    data_source,
    'operation_name' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_name_present) AS present,
    ROUND((SUM(operation_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'beneficiary_name' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(beneficiary_name_present) AS present,
    ROUND((SUM(beneficiary_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_summary' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_summary_present) AS present,
    ROUND((SUM(operation_summary_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_start_date' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_start_date_present) AS present,
    ROUND((SUM(operation_start_date_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_end_date' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_end_date_present) AS present,
    ROUND((SUM(operation_end_date_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_total_expenditure' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_total_expenditure_present) AS present,
    ROUND((SUM(operation_total_expenditure_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'eu_cofinancing_rate' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(eu_cofinancing_rate_present) AS present,
    ROUND((SUM(eu_cofinancing_rate_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'country' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(country_present) AS present,
    ROUND((SUM(country_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_location' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_location_present) AS present,
    ROUND((SUM(operation_location_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'name_of_category_intervention' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(name_of_category_intervention_present) AS present,
    ROUND((SUM(name_of_category_intervention_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'date_of_last_update' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(date_of_last_update_present) AS present,
    ROUND((SUM(date_of_last_update_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
)

SELECT
  *
FROM vw
ORDER BY 1,2;