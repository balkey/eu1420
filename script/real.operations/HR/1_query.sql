DROP TABLE IF EXISTS real.operations_hr;

CREATE TABLE real.operations_hr AS
WITH
"2014HR16M1OP001_1" AS (
  SELECT
    naziv_projekta AS operation_name,
    korisnik AS beneficiary_name,
    opis_projekta AS operation_summary,
    CASE
      WHEN is_numeric("datum_ugovaranja") THEN to_timestamp_from_excel(TO_NUMBER("datum_ugovaranja", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_ugovaranja",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("zakljucni_datum_provedbe_aktivnosti") THEN to_timestamp_from_excel(TO_NUMBER("zakljucni_datum_provedbe_aktivnosti", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("zakljucni_datum_provedbe_aktivnosti",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'HRK' AS currency,
    -- TODO: DOUBLE CHECK THAT THIS IS CROATIAN KUNA INDEED
    ukupno_prihvatljivi_troskovi::DECIMAL AS operation_total_expenditure,
    bespovratna_sredstva::DECIMAL / GREATEST((ukupno_prihvatljivi_troskovi::DECIMAL+bespovratna_sredstva::DECIMAL),1.0)*100.0AS eu_cofinancing_rate,
    -- TODO: DOUBLE CHECK IF ^ THIS IS CALCULATED CORRECTLY, AS THE FIELD NAMES ARE AMBIGUOUS! 
    NULL::TEXT AS country,
    zupanija AS operation_location,
    NULL AS code_of_category_intervention,
    operativni_program AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'HR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nutsii AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    zupanija AS operation_nuts3_name,
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
    '2014HR16M1OP001' AS cci,
    '2014HR16M1OP001_1' AS data_source
  FROM raw."2014HR16M1OP001_1"
),

vw AS (
  SELECT
    *
  FROM "2014HR16M1OP001_1"
)

SELECT
  *
FROM vw;
