WITH
base AS (
  SELECT
    currency,
    COUNT(*) AS value_count
  FROM real.operations_eu
  GROUP BY 1
),

vw AS (
  SELECT
    b.*,
    COALESCE(r.rate,1.00)
  FROM base AS b
  LEFT JOIN real.eur_exchange_rates AS r ON b.currency = r.currency
)

SELECT
  *
FROM vw;