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
    'Operation name' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_name_present) AS present,
    ROUND((SUM(operation_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Beneficiary name' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(beneficiary_name_present) AS present,
    ROUND((SUM(beneficiary_name_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Operation summary' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_summary_present) AS present,
    ROUND((SUM(operation_summary_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Operation start date' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_start_date_present) AS present,
    ROUND((SUM(operation_start_date_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Operation end date' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_end_date_present) AS present,
    ROUND((SUM(operation_end_date_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Operation total expenditure' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_total_expenditure_present) AS present,
    ROUND((SUM(operation_total_expenditure_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'EU cofinancing rate' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(eu_cofinancing_rate_present) AS present,
    ROUND((SUM(eu_cofinancing_rate_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Country' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(country_present) AS present,
    ROUND((SUM(country_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Operation location' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_location_present) AS present,
    ROUND((SUM(operation_location_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Name of category intervention' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(name_of_category_intervention_present) AS present,
    ROUND((SUM(name_of_category_intervention_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
  UNION ALL
  SELECT
    'Date of last update' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(date_of_last_update_present) AS present,
    ROUND((SUM(date_of_last_update_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1
)

SELECT
  *
FROM vw
ORDER BY
CASE
  WHEN column_name = 'Operation name' THEN 1
  WHEN column_name = 'Beneficiary name' THEN 2
  WHEN column_name = 'Operation summary' THEN 3
  WHEN column_name = 'Operation start date' THEN 4
  WHEN column_name = 'Operation end date' THEN 5
  WHEN column_name = 'Operation total expenditure' THEN 6
  WHEN column_name = 'EU cofinancing rate' THEN 7
  WHEN column_name = 'Country' THEN 8
  WHEN column_name = 'Operation location' THEN 9
  WHEN column_name = 'Name of category intervention' THEN 10
  WHEN column_name = 'Date of last update' THEN 11
END;
