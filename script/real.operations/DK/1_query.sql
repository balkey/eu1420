DROP TABLE IF EXISTS real.operations_dk;

CREATE TABLE real.operations_dk AS
WITH
"2014DK16RFOP001_1" AS (
  SELECT
    projektitel__operation_name AS operation_name,
    kontraktansvarlig_partner__beneficiary_name AS beneficiary_name,
    projektbeskrivelse AS operation_summary,
    CASE
      WHEN is_numeric("startdato__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("startdato__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("startdato__operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("slutdato__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("slutdato__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("slutdato__operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'DKK' AS currency,
    REPLACE(budget__budget, '.','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL > 1.0 THEN REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL 
      ELSE REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land__country AS country,
    region__region operation_location,
    NULL AS code_of_category_intervention,
    interventionskategori1__category_of_intervention1 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    postnr__operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(eumedfinansiering__union_cofinancing,'.','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    prioritetsakse__priority_axis AS priority_axis,
    NULL AS form_of_finance,
    interventionskategori2__category_of_intervention2 AS territorial_dimension,
    interventionskategori3__category_of_intervention3 AS territorial_delivery_mechanism,
    interventionskategori4__category_of_intervention4 AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DK16RFOP001' AS cci,
    '2014DK16RFOP001_1' AS data_source
  FROM raw."2014DK16RFOP001_1"
),

vw AS (
  SELECT * FROM "2014DK16RFOP001_1"
)

SELECT
  *
FROM vw;