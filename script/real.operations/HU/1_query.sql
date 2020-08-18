DROP TABLE IF EXISTS real.operations_hu;

CREATE TABLE real.operations_hu AS
WITH
"2014HU_1" AS (
  SELECT
    projekt_megnevezese__operation_name AS operation_name,
    palyazo_neve__beneficiary_name AS beneficiary_name,
    projekt_rovid_osszefoglalo__operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("megvalositas_kezdete__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("megvalositas_kezdete__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("megvalositas_kezdete__operation_start_date",'YYYY.MM.DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("megvalositas_befejezese__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("megvalositas_befejezese__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("megvalositas_befejezese__operation_end_date",'YYYY.MM.DD')::DATE
    END AS operation_end_date,
    'HUF' AS currency,
    megitelt_tamogatas_huf__grant_awarded_huf::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN (CHAR_LENGTH(unios_tarsfinanszirozasi_rata__union_cofinancing_rate) - CHAR_LENGTH(REPLACE(unios_tarsfinanszirozasi_rata__union_cofinancing_rate, ',', ''))) / CHAR_LENGTH(',') = 1 THEN REPLACE(regexp_replace(LOWER(REPLACE(REPLACE(REPLACE(unios_tarsfinanszirozasi_rata__union_cofinancing_rate,forras__fund,''),'-',''),' ','')), '[^0-9,]+', '','g'),',','.')::DECIMAL 
      WHEN LEFT(regexp_replace(LOWER(REPLACE(REPLACE(REPLACE(unios_tarsfinanszirozasi_rata__union_cofinancing_rate,forras__fund,''),'-',''),' ','')), '[^0-9,]+', '','g'),2) = '0,' THEN REPLACE(SUBSTRING(regexp_replace(unios_tarsfinanszirozasi_rata__union_cofinancing_rate, '[^0-9,]+', '','g'), 3, 4),',','.')::DECIMAL
      ELSE REPLACE(LEFT(regexp_replace(LOWER(REPLACE(REPLACE(REPLACE(unios_tarsfinanszirozasi_rata__union_cofinancing_rate,forras__fund,''),'-',''),' ','')), '[^0-9,]+', '','g'),4),',','.')::DECIMAL
    END AS eu_cofinancing_rate,
    orszag__country AS country,
    telepules__location AS operation_location,
    NULL AS code_of_category_intervention,
    beavatkozasi_kategoria__name_of_category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'HU' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    telepules__location AS operation_lau2_name,
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
    alintezkedes__support_scheme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014HU' AS cci,
    '2014HU_1' AS data_source
  FROM raw."2014HU_1"
),

vw AS (
  SELECT * FROM "2014HU_1"
)

SELECT
  *
FROM vw;
