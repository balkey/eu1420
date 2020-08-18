DROP TABLE IF EXISTS real.operations_lv;

CREATE TABLE real.operations_lv AS
WITH
"2014LV16MAOP001_1" AS (
  SELECT
    projektanosaukums__operation_namenameofproject AS operation_name,
    iesniedzejanosaukums__beneficiary_namenameofbeneficiary AS beneficiary_name,
    kopsavilkumssummary AS operation_summary,
    TO_DATE("sakumadatumsstartdate",'DD.MM.YYYY H:M:SS') AS operation_start_date,
    TO_DATE(beigudatumsfinishdate,'DD.MM.YYYY H:M:SS') AS operation_end_date,
    'EUR' AS currency,
    kopejaisfinansejumstotalfinancing::DECIMAL AS operation_total_expenditure,
    (esfondulidzfinansejumsunioncofinancing::DECIMAL / kopejaisfinansejumstotalfinancing::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    istenosanasvietasregionsregion AS operation_location,
    intervenceskategorijaskodscategoryofinterventioncode AS code_of_category_intervention,
    intervenceskategorijasnosaukumscategoryofinterventionname AS name_of_category_intervention,
    TO_DATE(pedejasdatuatjauninasanasdatumsdateoflastupdate, 'DD.MM.YYYY H:M:SS') AS date_of_last_update,
    'LV' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    istenosanasvietasregionsregion AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    esfondulidzfinansejumsunioncofinancing::DECIMAL AS eu_subsidy_value,
    iesniedzejaregnobeneficiaryregno AS beneficiary_id,
    projektanumurs__operation_noprojectno AS operation_id,
    samnosaukumsnameofspecificobjective AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014LV16MAOP001' AS cci,
    '2014LV16MAOP001_1' AS data_source
  FROM raw."2014LV16MAOP001_1"
),

vw AS (
  SELECT * FROM "2014LV16MAOP001_1"
)

SELECT
  *
FROM vw;
