SELECT
  operation_nuts0,
  COUNT(*) AS transaction_count,
  COUNT(DISTINCT operation_name) AS operation_count,
  COUNT(DISTINCT beneficiary_name) AS beneficiary_count,
  SUM(operation_total_expenditure_eur) AS operation_total_expenditure,
  SUM(operation_total_expenditure_eur/100.0*COALESCE(eu_cofinancing_rate,1.0)) AS subsidies_allocated,
  AVG(eu_cofinancing_rate) AS avg_eu_cofinancing_rate
  -- TODO: TC looks crooked, needs to check!!!
FROM real.operations_eu
GROUP BY 1
ORDER BY 1;