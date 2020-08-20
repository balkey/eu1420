DROP TABLE IF EXISTS real.operations_bg;

CREATE TABLE real.operations_bg AS
WITH
"2014BG05M2OP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2014BG05M2OP001' AS cci,
    '2014BG05M2OP001_1' AS data_source
  FROM raw."2014BG05M2OP001_1"
),

"2014BG16M1OP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2014BG16M1OP001' AS cci,
    '2014BG16M1OP001_1' AS data_source
  FROM raw."2014BG16M1OP001_1"
),

"2014BG16M1OP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2014BG16M1OP002' AS cci,
    '2014BG16M1OP002_1' AS data_source
  FROM raw."2014BG16M1OP002_1"
),

"2014BG16RFOP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2014BG16RFOP001' AS cci,
    '2014BG16RFOP001_1' AS data_source
  FROM raw."2014BG16RFOP001_1"
),

"2014BG16RFOP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2014BG16RFOP002' AS cci,
    '2014BG16RFOP002_1' AS data_source
  FROM raw."2014BG16RFOP002_1"
),

"2015BG16RFSM001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'BGN' AS currency,
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    "location" AS operation_city,
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
    '2015BG16RFSM001' AS cci,
    '2015BG16RFSM001_1' AS data_source
  FROM raw."2015BG16RFSM001_1"
 ),

vw AS (
  SELECT * FROM "2014BG05M2OP001_1"
  UNION ALL
  SELECT * FROM "2014BG16M1OP001_1"
  UNION ALL
  SELECT * FROM "2014BG16M1OP002_1"
  UNION ALL
  SELECT * FROM "2014BG16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014BG16RFOP002_1"
  UNION ALL
  SELECT * FROM "2015BG16RFSM001_1"
)

SELECT
  *
FROM vw;