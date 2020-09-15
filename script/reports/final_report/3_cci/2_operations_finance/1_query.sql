WITH
base AS (
  SELECT
    e.cci,
    COALESCE(c.programme_title,(e.cci||' (CCI code / programme title unretrievable)')) AS programme_title,
    COUNT(e.*) AS transaction_count,
    COUNT(DISTINCT e.operation_name) AS operation_count,
    COUNT(DISTINCT e.beneficiary_name) AS beneficiary_count,
    ROUND(SUM(e.operation_total_expenditure_eur),0) AS operation_total_expenditure,
    ROUND(SUM(e.operation_total_expenditure_eur/100.0*COALESCE(eu_cofinancing_rate,1.0)),0) AS subsidies_allocated,
    ROUND(AVG(e.eu_cofinancing_rate),2) AS avg_eu_cofinancing_rate
  FROM real.operations_eu AS e
  LEFT JOIN real.cci_codes AS c ON e.cci = c.cci_code
  GROUP BY 1,2
)

SELECT
  programme_title,
  transaction_count,
  operation_count,
  beneficiary_count,
  operation_total_expenditure,
  subsidies_allocated
  --avg_eu_cofinancing_rate
FROM base 
ORDER BY cci;  
