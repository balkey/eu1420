DROP TABLE IF EXISTS real.operations_uk;

CREATE TABLE real.operations_uk AS
WITH
"2014UK16RFOP001_1" AS (
  SELECT
    name_of_project AS operation_name,
    recipient_of_funds AS beneficiary_name,
    summary_of_project_max_100_words AS operation_summary,
    CASE
      WHEN LEFT(start_date,10) ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN start_date::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN LEFT(end_date,10) ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN end_date::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'GBP' AS currency,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(total_project_costs_psm,',',''),' ','')) THEN REPLACE(REPLACE(total_project_costs_psm,',',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS operation_total_expenditure,
    CASE
      WHEN _of_project_funded_by_eu::DECIMAL > 1.0 THEN _of_project_funded_by_eu::DECIMAL
      ELSE _of_project_funded_by_eu::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    location_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    type_and_focus_of_support_category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    location_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(erdfesf_investment_psm,',',''),' ','')) THEN REPLACE(REPLACE(erdfesf_investment_psm,',',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP001' AS cci,
    '2014UK16RFOP001_1' AS data_source
  FROM raw."2014UK16RFOP001_1"
  WHERE recipient_of_funds != 'Bénéficiaire'
),

"2014UK16RFOP002_1" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'GBP' AS currency,
    REPLACE(SPLIT_PART(total_ps,' (',1),',','')::DECIMAL AS operation_total_expenditure,
    REPLACE(SPLIT_PART(eu_ps_30,' (',1),',','')::DECIMAL / REPLACE(SPLIT_PART(total_ps,' (',1),',','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(SPLIT_PART(eu_ps_30,' (',1),',','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_1' AS data_source
  FROM raw."2014UK16RFOP002_1"
  WHERE project_no != 'Last update: 13/11/2019'
),

"2014UK16RFOP002_2" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'GBP' AS currency,
    REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL / REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_no AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_2' AS data_source
  FROM raw."2014UK16RFOP002_2"
  WHERE project_no != 'Last update: 28/05/2020'
    AND sponsor != 'TOTALS:'
),

"2014UK16RFOP002_3" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'GBP' AS currency,
    REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL / REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_no AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_3' AS data_source
  FROM raw."2014UK16RFOP002_3"
  WHERE project_no != 'Last update: 08/11/2019'
    AND sponsor != 'TOTALS:'
),

"2014UK16RFOP004_1" AS (
  SELECT
    operation_name AS operation_name,
    recipient_organisation1 AS beneficiary_name,
    description AS operation_summary,
    TO_DATE(REPLACE(REPLACE(SPLIT_PART(REPLACE("start_and_end_dates",'–','-'),'-',1),' ',''),'331','31'),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(REPLACE(SPLIT_PART(REPLACE("start_and_end_dates",'–','-'),'-',2),' ',''),'331','31'),'DD.MM.YYYY')::DATE AS operation_end_date,
    'GBP' AS currency,
    total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate::DECIMAL > 1.0 THEN union_cofinancing_rate::DECIMAL
      ELSE union_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    postcode AS operation_location,
    NULL AS code_of_category_intervention,
    categories_of_intervention_2 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    categories_of_intervention AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    esf_erdf_grant_requested::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    investment_priority AS priority_axis,
    categories_of_intervention_5 AS form_of_finance,
    categories_of_intervention_6 AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    categories_of_intervention_7 AS economic_dimension,
    '2014UK16RFOP004' AS cci,
    '2014UK16RFOP004_1' AS data_source
  FROM raw."2014UK16RFOP004_1"
  WHERE recipient_organisation1 NOT IN ('Recipient organisation', '1 See Sheet2 for the data fields in other languages')
    AND union_cofinancing_rate IS NOT NULL
),

"2014UK_1" AS (
  SELECT
    project_title AS operation_name,
    lead_organisation AS beneficiary_name,
    project_description AS operation_summary,
    project_start_date::DATE AS operation_start_date,
    project_end_date::DATE AS operation_end_date,
    'GBP' AS currency,
    total_project_cost::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_as_per_priority_axis::DECIMAL > 1.0 THEN union_cofinancing_rate_as_per_priority_axis::DECIMAL
      ELSE union_cofinancing_rate_as_per_priority_axis::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    regional_areas AS operation_location,
    NULL AS code_of_category_intervention,
    category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    regional_areas AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    eu_funds_awarded::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    case_id AS operation_id,
    priority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK' AS cci,
    '2014UK_1' AS data_source
  FROM raw."2014UK_1"
  WHERE total_project_cost != 'Total Project cost'
),

vw AS (
  SELECT * FROM "2014UK16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_2"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_3"
  UNION ALL
  SELECT * FROM "2014UK16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014UK_1"
)

SELECT
  *
FROM vw;
