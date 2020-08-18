DROP TABLE IF EXISTS real.operations_ie;

CREATE TABLE real.operations_ie AS
WITH
"2014IE16RFOP001_1" AS (
  SELECT
    project_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    project_summary AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_public_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN erdf_cofinancing_rate::DECIMAL > 1.0 THEN erdf_cofinancing_rate::DECIMAL
      ELSE erdf_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    postcodecounty AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'IE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    postcodecounty AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014IE16RFOP001' AS cci,
    '2014IE16RFOP001_1' AS data_source
  FROM raw."2014IE16RFOP001_1"
),

"2014IE16RFOP002_1" AS (
  SELECT
    project_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    project_summary AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_public_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN erdf_rate::DECIMAL > 1.0 THEN erdf_rate::DECIMAL
      ELSE erdf_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    project_eircode_county AS operation_location,
    NULL AS code_of_category_intervention,
    category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'IE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nuts_region AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    project_eircode_county AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    erdf_amount::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_unique_id_2_new AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014IE16RFOP002' AS cci,
    '2014IE16RFOP002_1' AS data_source
  FROM raw."2014IE16RFOP002_1"
),

vw AS (
  SELECT * FROM "2014IE16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014IE16RFOP002_1"
)

SELECT
  *
FROM vw;
