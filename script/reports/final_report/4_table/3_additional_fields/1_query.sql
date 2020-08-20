WITH
base AS (
  SELECT
    *,
    CASE
      WHEN beneficiary_id IS NOT NULL THEN 1
      ELSE 0
    END AS beneficiary_id_present,
    CASE
      WHEN operation_id IS NOT NULL THEN 1
      ELSE 0
    END AS operation_id_present,
    CASE
      WHEN priority_axis IS NOT NULL THEN 1
      ELSE 0
    END AS priority_axis_present,
    CASE
      WHEN form_of_finance IS NOT NULL THEN 1
      ELSE 0
    END AS form_of_finance_present,
    CASE
      WHEN territorial_dimension IS NOT NULL THEN 1
      ELSE 0
    END AS territorial_dimension_present,
    CASE
      WHEN territorial_delivery_mechanism IS NOT NULL THEN 1
      ELSE 0
    END AS territorial_delivery_mechanism_present,
    CASE
      WHEN esf_secondary_theme IS NOT NULL THEN 1
      ELSE 0
    END AS esf_secondary_theme_present,
    CASE
      WHEN economic_dimension IS NOT NULL THEN 1
      ELSE 0
    END AS economic_dimension_present
  FROM real.operations_eu
),

vw AS (
  SELECT
    data_source,
    'beneficiary_id' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(beneficiary_id_present) AS present,
    ROUND((SUM(beneficiary_id_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'operation_id' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(operation_id_present) AS present,
    ROUND((SUM(operation_id_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'priority_axis' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(priority_axis_present) AS present,
    ROUND((SUM(priority_axis_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'form_of_finance' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(form_of_finance_present) AS present,
    ROUND((SUM(form_of_finance_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'territorial_dimension' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(territorial_dimension_present) AS present,
    ROUND((SUM(territorial_dimension_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'territorial_delivery_mechanism' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(territorial_delivery_mechanism_present) AS present,
    ROUND((SUM(territorial_delivery_mechanism_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'esf_secondary_theme' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(esf_secondary_theme_present) AS present,
    ROUND((SUM(esf_secondary_theme_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
  UNION ALL
  SELECT
    data_source,
    'economic_dimension' AS column_name,
    COUNT(*) AS transaction_count,
    SUM(economic_dimension_present) AS present,
    ROUND((SUM(economic_dimension_present)*1.0 / COUNT(*))*100.0,2) AS percentage
  FROM base
  GROUP BY 1,2
)

SELECT
  *
FROM vw
ORDER BY 1,2;