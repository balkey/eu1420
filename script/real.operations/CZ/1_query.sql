DROP TABLE IF EXISTS real.operations_cz;

CREATE TABLE real.operations_cz AS
WITH
"2014CZ_1" AS (
  SELECT
    nazev_projektu__nazev_operace AS operation_name,
    nazev_zadateleprijemce_neuvadet_jmena_fyzickych_osob_misto_jme AS beneficiary_name,
    shrnuti_operace AS operation_summary,
    TO_DATE(datum_zahajeni_fyzicke_operace,'DD.MM.YYYY')::DATE AS operation_start_date,
    COALESCE(TO_DATE(skutecne_datum_ukonceni_fyzicke_realizace_operace,'DD.MM.YYYY')::DATE, TO_DATE(predpokladane_datum_ukonceni_fyzicke_realizace_operace,'DD.MM.YYYY')::DATE) AS operation_end_date,
    mena AS currency,
    celkove_zpusobile_vydaje_pridelene_na_operaci_czk::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN mira_spolufinancovani_ze_strany_unie::DECIMAL > 1.0 THEN mira_spolufinancovani_ze_strany_unie::DECIMAL
      ELSE mira_spolufinancovani_ze_strany_unie::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    zeme AS country,
    nazev_nuts_3 AS operation_location,
    oblast_intervence__kod AS code_of_category_intervention,
    oblast_intervence__nazev name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'CZ' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    kod_nuts_3 AS operation_nuts3_code,
    nazev_nuts_3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(psc_prijemce,'.0','') AS operation_zip_code,
    celkove_zpusobile_vydaje_pridelene_na_operaci_verejne_zdroje_c::DECIMAL + celkove_zpusobile_vydaje_pridelene_na_operaci_narodni_soukrome::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    ic AS beneficiary_id,
    registracni_cislo_projektuoperace AS operation_id,
    nazev_prioritni_osy__priority_unie AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014CZ' AS cci,
    '2014CZ_1' AS data_source
  FROM raw."2014CZ_1"
  WHERE mena != 'Currency'
),

vw AS (
  SELECT * FROM "2014CZ_1"
)

SELECT
  *
FROM vw;