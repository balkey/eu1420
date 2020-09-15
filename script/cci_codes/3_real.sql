DROP TABLE IF EXISTS real.cci_codes;

CREATE TABLE real.cci_codes AS
WITH
  base AS (
  SELECT
    country_code,
    cci_code,
    programme_title,
    ROW_NUMBER() OVER(PARTITION BY cci_code ORDER BY programme_title) AS row_num
   FROM raw.cci_codes
)

SELECT
  country_code,
  cci_code,
  programme_title
FROM base
WHERE row_num = 1
ORDER BY 1,2;