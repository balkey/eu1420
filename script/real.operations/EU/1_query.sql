DROP TABLE IF EXISTS real.operations_eu;

CREATE TABLE real.operations_eu AS
WITH
base AS (
  SELECT * FROM real.operations_at
  UNION ALL
  SELECT * FROM real.operations_be
  UNION ALL
  SELECT * FROM real.operations_bg
  UNION ALL
  SELECT * FROM real.operations_cz
  UNION ALL
  SELECT * FROM real.operations_de
  UNION ALL
  SELECT * FROM real.operations_dk
  UNION ALL
  SELECT * FROM real.operations_es
  UNION ALL
  SELECT * FROM real.operations_fr
  UNION ALL
  SELECT * FROM real.operations_gr
  UNION ALL
  SELECT * FROM real.operations_hr
  UNION ALL
  SELECT * FROM real.operations_hu
  UNION ALL
  SELECT * FROM real.operations_ie
  UNION ALL
  SELECT * FROM real.operations_it
  UNION ALL
  SELECT * FROM real.operations_lu
  UNION ALL
  SELECT * FROM real.operations_lv
  UNION ALL
  SELECT * FROM real.operations_nl
  UNION ALL
  SELECT * FROM real.operations_pl
  UNION ALL
  SELECT * FROM real.operations_pt
  UNION ALL
  SELECT * FROM real.operations_ro
  UNION ALL
  SELECT * FROM real.operations_si
  UNION ALL
  SELECT * FROM real.operations_sk
  UNION ALL
  SELECT * FROM real.operations_uk
  UNION ALL
  SELECT * FROM real.operations_tc
),

currency_converted AS (
  SELECT
    b.*,
    rate,
    ROUND((operation_total_expenditure / COALESCE(rate,1.0)),2) AS operation_total_expenditure_eur,
    ROUND((eu_subsidy_value / COALESCE(rate,1.0)),2) AS eu_subsdidy_value_eur   
  FROM base AS b
  LEFT JOIN real.eur_exchange_rates AS e ON b.currency = e.currency

)

SELECT
  *
FROM currency_converted
WHERE (operation_name IS NOT NULL
  OR beneficiary_name IS NOT NULL);