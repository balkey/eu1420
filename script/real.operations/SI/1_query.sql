DROP TABLE IF EXISTS real.operations_si;

CREATE TABLE real.operations_si AS
WITH
"2014SI16MAOP001_1" AS (
  SELECT
    ime_operacijeoperation_name AS operation_name,
    ime_upravicenca__beneficiary_name AS beneficiary_name,
    povzetek_operacijeoperation_summary AS operation_summary,
    CASE
      WHEN is_numeric("datum_zacetka_operacije_operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("datum_zacetka_operacije_operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_zacetka_operacije_operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("datum_zakljucka_operacije_operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("datum_zakljucka_operacije_operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_zakljucka_operacije_operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(skupni_upraviceni_izdatki_dodeljeni_operacijitotal_eligible_ex,'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN stopnja_sofinanciranja_unije_po_prednostnih_oseh__union_cofinn::DECIMAL > 1.0 THEN stopnja_sofinanciranja_unije_po_prednostnih_oseh__union_cofinn::DECIMAL
      ELSE stopnja_sofinanciranja_unije_po_prednostnih_oseh__union_cofinn::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    drzava_country AS country,
    obcinamunicipality AS operation_location,
    NULL AS code_of_category_intervention,
    datum_zadnje_posodobitve_seznama_operacijdate_of_last_update_o AS name_of_category_intervention,
    TO_DATE(datum_zadnje_posodobitve_seznama_operacijdate_of_last_update_o, 'DD.MM.YYYY')::DATE AS date_of_last_update,
    'SI' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    statisticna_regijastatistical_region AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    postapost_office AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    obcinamunicipality AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    postna_stevilka_operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    sifra_operacijeoperation_code AS operation_id,
    kratek_naziv_prednostne_osishort_priority_axis_name AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SI16MAOP001' AS cci,
    '2014SI16MAOP001_1' AS data_source
  FROM raw."2014SI16MAOP001_1"
  WHERE sifra_operacijeoperation_code != '0.0'
),

vw AS (
  SELECT * FROM "2014SI16MAOP001_1"
)

SELECT
  *
FROM vw;
