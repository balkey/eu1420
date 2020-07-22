WITH
"" AS (
  SELECT
    AS operation_name,
    AS beneficiary_name,
    AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("", '99999D9')::INTEGER) AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("", '99999D9')::INTEGER) AS operation_end_date,
    'EUR' AS currency,
    AS operation_total_expenditure,
    AS eu_cofinancing_rate,
    AS country,
    AS operation_location,
    AS code_of_category_intervention,
    AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    '' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    '' AS cci,
    '' AS data_source
  FROM raw.""
)

SELECT
  *
FROM "";