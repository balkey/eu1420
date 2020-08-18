DROP TABLE IF EXISTS real.operations_lu;

CREATE TABLE real.operations_lu AS
WITH
"2014LU16RFOP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    erdf_cofinancing_40::DECIMAL / total_eligible_expenditure::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    municipality AS operation_location,
    category_of_intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'LU' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipality AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ndeg_of_project AS operation_id,
    axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014LU16RFOP001' AS cci,
    '2014LU16RFOP001_1' AS data_source
  FROM raw."2014LU16RFOP001_1"
  WHERE beneficiary_name NOT IN ('Beneficiary name','Nom du bénéficiaire')
),

vw AS (
  SELECT * FROM "2014LU16RFOP001_1"
)

SELECT
  *
FROM vw;
