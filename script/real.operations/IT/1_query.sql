DROP TABLE IF EXISTS real.operations_it;

CREATE TABLE real.operations_it AS
WITH
"2014ITERDFTC_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITERDFTC' AS cci,
    '2014ITERDFTC_1' AS data_source
  FROM raw."2014ITERDFTC_1"
),

"2014ITERDF_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITERDF' AS cci,
    '2014ITERDF_1' AS data_source
  FROM raw."2014ITERDF_1"
),

"2014ITESF_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITESF' AS cci,
    '2014ITESF_1' AS data_source
  FROM raw."2014ITESF_1"
),

vw AS (
  SELECT * FROM "2014ITERDFTC_1"
  UNION ALL
  SELECT * FROM "2014ITERDF_1"
  UNION ALL
  SELECT * FROM "2014ITESF_1"
)

SELECT
  *
FROM vw;
