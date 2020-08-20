DROP TABLE IF EXISTS real.operations_at;

CREATE TABLE real.operations_at AS
WITH
"2014AT16RFOP001" AS (
  SELECT
    bezeichnung_des_vorhabens_operation_name AS operation_name,
    name_des_begunstigten_name_of_beneficiary AS beneficiary_name,
    zusammenfassung_des_vorhabens_operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER(datum_des_beginns_des_vorhabens_operation_start_date, '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER(datum_des_endes_des_vorhabens_operation_end_date, '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens_total_el::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL > 1.0 THEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL
      ELSE unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    regionalcode_des_vorhabens_location_indicator AS operation_location,
    NULL AS code_of_category_intervention,
    bezeichnung_der_interventionskategorie_fur_das_vorhaben_name_o AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'AT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    regionalcode_des_vorhabens_location_indicator AS operation_lau2_name,
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
    '2014AT16RFOP001' AS cci,
    '2014AT16RFOP001_1' AS data_source
  FROM raw."2014AT16RFOP001_1"
),

vw AS (
  SELECT
    *
  FROM "2014AT16RFOP001"
)

SELECT
  *
FROM vw;
