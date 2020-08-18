DROP TABLE IF EXISTS real.operations_de;

CREATE TABLE real.operations_de AS
WITH
"2014DE16M2OP001_1" AS (
  SELECT
    bezeichnung_des_vorhabens AS operation_name,
    name_des_begunstigten AS beneficiary_name,
    zusammenfassung_des_vorhabens AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens_in_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unions_kofinan_zierungssatz::DECIMAL > 1.0 THEN unions_kofinan_zierungssatz::DECIMAL
      ELSE unions_kofinan_zierungssatz::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    landkreis AS operation_location,
    interventionsbereich AS code_of_category_intervention,
    interventionsbereich_2 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    landkreis AS operation_nuts3_name,
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
    '2014DE16M2OP001' AS cci,
    '2014DE16M2OP001_1' AS data_source
  FROM raw."2014DE16M2OP001_1"
  WHERE bezeichnung_des_vorhabens != 'operation name'
),

"2014DE16RFOP002_1" AS (
  SELECT
    bezeichnung_des_vorhabens__operation_name AS operation_name,
    name_des_begunstigten__beneficiary_name AS beneficiary_name,
    zusammenfassung_des_vorhabens__operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens__operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens__operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens__total_e::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,'*',''),'%','')::DECIMAL > 1.0 THEN REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,'*',''),'%','')::DECIMAL
      ELSE REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,'*',''),'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land__country AS country,
    durchfuhrungsort__location AS operation_location,
    NULL AS code_of_category_intervention,
    interventionsbereich__intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    finanzierungsform__form_of_finance AS form_of_finance,
    art_des_gebiets__territorial_dimension AS territorial_dimension,
    territoriale_umsetzungsmechanismen__territorial_delivery_mecha AS territorial_delivery_mechanism,
    thematisches_ziel__thematic_objective_dimension AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP002' AS cci,
    '2014DE16RFOP002_1' AS data_source
  FROM raw."2014DE16RFOP002_1"
  WHERE bezeichnung_des_vorhabens__operation_name IS NOT NULL
),

"2014DE16RFOP003_1" AS (
  SELECT
    projektbezeichnung AS operation_name,
    name_des_begunstigten AS beneficiary_name,
    projektbeschreibung AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(unionskofinanzierungssatz_pro_prioritatsachse,'%', '')::DECIMAL > 1.0 THEN REPLACE(unionskofinanzierungssatz_pro_prioritatsachse,'%', '')::DECIMAL
      ELSE REPLACE(unionskofinanzierungssatz_pro_prioritatsachse,'%', '')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    durchfuhrungsort AS operation_location,
    interventionskategorie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    postleitzahl_durchfuhrungsort AS operation_zip_code,
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
    '2014DE16RFOP003' AS cci,
    '2014DE16RFOP003_1' AS data_source
  FROM raw."2014DE16RFOP003_1"
  WHERE name_des_begunstigten != 'beneficiary name (only of legal entities; no natural persons shall be named)'
),

"2014DE16RFOP004_1" AS (
  SELECT
    bezeichnung_des_vorhabens__zusammenfassung_des_vorhabens AS operation_name,
    name_des_begnstigten AS beneficiary_name,
    bezeichnung_des_vorhabens__zusammenfassung_des_vorhabens AS operation_summary,
    TO_DATE(beginns_des_vorhabens,'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(ende_des_vorhabens,'DD.MM.YYYY')::DATE AS operation_start_date,
    'EUR' AS currency,
    REPLACE(REPLACE(gesamtbetrag_der_frderfhigen_ausgaben_des_vorhabens,'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(unionskofinanzierungssatz_pro_priorittsachse,'%','')::DECIMAL > 1.0 THEN REPLACE(unionskofinanzierungssatz_pro_priorittsachse,'%','')::DECIMAL
      ELSE REPLACE(unionskofinanzierungssatz_pro_priorittsachse,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    ort_des_vorhabens AS operation_location,
    bezeichnung_der_interventionskategorie AS code_of_category_intervention,
    missing_column_name_1 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    ort_des_vorhabens AS operation_city,
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
    '2014DE16RFOP004' AS cci,
    '2014DE16RFOP004_1' AS data_source
  FROM raw."2014DE16RFOP004_1"
  WHERE name_des_begnstigten != 'Beneficiary name'
),

"2014DE16RFOP005_1" AS (
  SELECT
    bezeichnung_des_vorhabens_operation_name AS operation_name,
    name_des_begunstigten_beneficiary_name AS beneficiary_name,
    zusammenfassung_des_vorhabens_operation_summary AS operation_summary,
    TO_DATE(beginn_des_vorhabens_operation_start_date,'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(ende_des_vorhabens_operation_end_date,'DD.MM.YYYY')::DATE AS operation_start_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens_total_el::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL > 1.0 THEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL 
      ELSE unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    postleitzahl_des_vorhabens_operation_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    bezeichnung_der_interventionskategorie_name_of_category_of_int AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    postleitzahl_des_vorhabens_operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(lfd_nr,'.0','') AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP005' AS cci,
    '2014DE16RFOP005_1' AS data_source
  FROM raw."2014DE16RFOP005_1"
),

"2014DE16RFOP006_1" AS (
  SELECT
    bezeichnung_des_vorhabens_operation_name AS operation_name,
    name_des_begunstigten_beneficiary_name AS beneficiary_name,
    zusammenfassung_des_vorhabens_operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens_operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens_operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens_total_el::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL > 1.0 THEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL
      ELSE unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    REPLACE(postleitzahl_des_vorhabens_operation_postcode,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    interventionsbereich_intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    REPLACE(postleitzahl_des_vorhabens_operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    finanzierungsform_form_of_finance AS form_of_finance,
    art_des_gebiets_territory_type AS territorial_dimension,
    territoriale_umsetzungsmecha_nismen_territorial_delivery_mecha AS territorial_delivery_mechanism,
    thematisches_ziel_thematic_objective AS esf_secondary_theme,
    wirtschaftszweig_economic_activitz AS economic_dimension,
    '2014DE16RFOP006' AS cci,
    '2014DE16RFOP006_1' AS data_source
  FROM raw."2014DE16RFOP006_1"
),

"2014DE16RFOP007_1" AS (
  SELECT
    bezeichnung_des_vorhabens_operation_name AS operation_name,
    name_des_begunstigten_beneficiary_name AS beneficiary_name,
    zusammenfassung_des_vorhabens_operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens_operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens_operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbeitrag_der_forderfahigen_ausgaben_des_vorhabens_in_eur_::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin,',','.'),'%','')::DECIMAL > 1.0 THEN REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin,',','.'),'%','')::DECIMAL
      ELSE REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin,',','.'),'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    postleitzahl_des_vorhabens_operation_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    interventionsbereich_iintervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    antragsnummer AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP007' AS cci,
    '2014DE16RFOP007_1' AS data_source
  FROM raw."2014DE16RFOP007_1"
),

"2014DE16RFOP009_1" AS (
  SELECT
    bezeichnung_des_vorhabens_name_of_operation AS operation_name,
    name_des_begnstigten_name_of_beneficiary AS beneficiary_name,
    zusammenfassung_des_vorhabens_summary_of_operation AS operation_summary,
    TO_DATE(durchfhrungsbeginn_start_of_operation,'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(durchfhrungsende_end_of_operation,'DD.MM.YYYY')::DATE AS operation_start_date,
    'EUR' AS currency,
    REPLACE(REPLACE(bewilligte_frderfhige_gesamtinvestition_totel_eligible_expendi,'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(unionskofinanzierungssatz_union_cofinancing_rate,'%','')::DECIMAL > 1.0 THEN REPLACE(unionskofinanzierungssatz_union_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(unionskofinanzierungssatz_union_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    gebietsname_location_of_implementation AS operation_location,
    euinterventionskategorie_category_of_intervention AS code_of_category_intervention,
    bezeichnung_der_euinterventionskategorie_name_of_category_of_i AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    gebietskennziffer_code_of_location AS operation_lau2_code,
    gebietsname_location_of_implementation AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(REPLACE(bewilligte_eumittel_eu_funding,'.',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    efrekennzeichen_efreid AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP009' AS cci,
    '2014DE16RFOP009_1' AS data_source
  FROM raw."2014DE16RFOP009_1"
),

"2014DE16RFOP011_1" AS (
  SELECT
    bezeichnung_des_vorhabens__operation_name AS operation_name,
    name_des_begunstigten__beneficiary_name AS beneficiary_name,
    zusammenfassung_des_vorhabens__operation_summary AS operation_summary,
    CASE
      WHEN is_numeric(datum_des_beginns_des_vorhabens__operation_start_date) THEN to_timestamp_from_excel(TO_NUMBER("datum_des_beginns_des_vorhabens__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(datum_des_beginns_des_vorhabens__operation_start_date,'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(datum_des_endes_des_vorhabens__operation_end_date) THEN to_timestamp_from_excel(TO_NUMBER("datum_des_endes_des_vorhabens__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(datum_des_endes_des_vorhabens__operation_end_date,'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens__total_e::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,',','.'),'%',''),' ','')::DECIMAL > 1.0 THEN REPLACE(REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,',','.'),'%',''),' ','')::DECIMAL 
      ELSE REPLACE(REPLACE(REPLACE(unionskofinanzierungssatz_pro_prioritatsachse__union_cofinanci,',','.'),'%',''),' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    postleitzahl_des_vorhabens__operation_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    interventionsbereich__intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    land__country AS operation_nuts1_name,
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
    postleitzahl_des_vorhabens__operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    thematisches_ziel__thematic_objective_dimension AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP011' AS cci,
    '2014DE16RFOP011_1' AS data_source
  FROM raw."2014DE16RFOP011_1"
),

"2014DE16RFOP012_1" AS (
  SELECT
    "2_bezeichnung_des_vorhabens" AS operation_name,
    "1_name_des_begnstigten" AS beneficiary_name,
    "3_zusammenfassung_des_vorhabens" AS operation_summary,
    CASE
      WHEN is_numeric("4_datum_des_beginns_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("4_datum_des_beginns_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(REPLACE(LOWER("4_datum_des_beginns_des_vorhabens"),'o','0'),'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("5_datum_des_endes_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("5_datum_des_endes_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(REPLACE(LOWER("5_datum_des_endes_des_vorhabens"),'o','0'),'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE("6_gesamtbetrag_der_frderfhigen_ausgaben_des_vorhabens",'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN "7_unionskofinanzierungssatz_pro_priorittsachse"::DECIMAL > 1.0 THEN "7_unionskofinanzierungssatz_pro_priorittsachse"::DECIMAL
      ELSE "7_unionskofinanzierungssatz_pro_priorittsachse"::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    "10_land" AS country,
    "8_durchfhrungsort_des_vorhabens" AS operation_location,
    NULL AS code_of_category_intervention,
    "11_bezeichnung_der_interventionskategorie_fr_das_vorhaben" AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    "9_landkreiskreisfreie_gemeinde_groe_kreisstdte" AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    "8_durchfhrungsort_des_vorhabens" AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    "16_vorhabensident" AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP012' AS cci,
    '2014DE16RFOP012_1' AS data_source
  FROM raw."2014DE16RFOP012_1"
  WHERE "1_name_des_begnstigten" != '(Beneficiary name)'
),

"2014DE16RFOP013_1" AS (
  SELECT
    bezeichnung_des_vorhabens AS operation_name,
    name_des_begunstigten1 AS beneficiary_name,
    zusammenfassung_des_vorhabens AS operation_summary,
    CASE
      WHEN is_numeric("beginn_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("beginn_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("beginn_des_vorhabens",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("ende_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("ende_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("ende_des_vorhabens",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    forderfahige_ausgaben_des_vorhabens_in_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eukofinanzierungssatz_der_prioritatsachse_des_vorhabens_in_::DECIMAL > 1.0 THEN eukofinanzierungssatz_der_prioritatsachse_des_vorhabens_in_::DECIMAL 
      ELSE eukofinanzierungssatz_der_prioritatsachse_des_vorhabens_in_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    name_des_investitionsortes AS operation_location,
    interventionskategorien_fur_das_vorhaben2 AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    name_des_investitionsortes AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektcode_des_vorhabens AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DE16RFOP013' AS cci,
    '2014DE16RFOP013_1' AS data_source
  FROM raw."2014DE16RFOP013_1"
  WHERE name_des_begunstigten1 != 'beneficiary name'
),

"2014DE16RFOP014_1" AS (
  SELECT
    bezeichnung_des_vorhabens AS operation_name,
    name_des_begunstigten AS beneficiary_name,
    zusammenfassung_des_vorhabens AS operation_summary,
    CASE
      WHEN is_numeric("beginn_des_vorhabens_nur_efre") THEN to_timestamp_from_excel(TO_NUMBER("beginn_des_vorhabens_nur_efre", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("beginn_des_vorhabens_nur_efre",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(ende_des_vorhabens_nur_efre) != 7 THEN NULL
      WHEN is_numeric("ende_des_vorhabens_nur_efre") THEN to_timestamp_from_excel(TO_NUMBER("ende_des_vorhabens_nur_efre", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("ende_des_vorhabens_nur_efre",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    gesambetrag_der_forderfahigen_ausgaben_des_vorhabens::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinan_zierungs_satz_pro_prioritats_achse_nur_efre::DECIMAL > 1.0 THEN unionskofinan_zierungs_satz_pro_prioritats_achse_nur_efre::DECIMAL
      ELSE unionskofinan_zierungs_satz_pro_prioritats_achse_nur_efre::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    postleit_zahl_des_vor_habens AS operation_location,
    NULL AS code_of_category_intervention,
    bezeichnung_der_interventions_kategorie_nur_efre AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    postleit_zahl_des_vor_habens AS operation_zip_code,
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
    '2014DE16RFOP014' AS cci,
    '2014DE16RFOP014_1' AS data_source
  FROM raw."2014DE16RFOP014_1"
  WHERE name_des_begunstigten != 'beneficiary name'
),

"2014DE16RFOP015_1" AS (
  SELECT
    bezeichnung_des_vorhabens AS operation_name,
    name_des_begunstigten AS beneficiary_name,
    zusammenfassung_des_vorhabens AS operation_summary,
    CASE
      WHEN is_numeric("beginn_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("beginn_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("beginn_des_vorhabens",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("ende_des_vorhabens") THEN to_timestamp_from_excel(TO_NUMBER("ende_des_vorhabens", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("ende_des_vorhabens",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinan_zierungssatz_pro_prioritatsachse::DECIMAL > 1 THEN unionskofinan_zierungssatz_pro_prioritatsachse::DECIMAL
      ELSE unionskofinan_zierungssatz_pro_prioritatsachse::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    postleitzahl_des_vorhabens AS operation_location,
    NULL AS code_of_category_intervention,
    bezeichnung_der_interventionskategorie AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DE' AS operation_nuts0,
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
    postleitzahl_des_vorhabens AS operation_zip_code,
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
    '2014DE16RFOP015' AS cci,
    '2014DE16RFOP015_1' AS data_source
  FROM raw."2014DE16RFOP015_1"
  WHERE name_des_begunstigten != 'beneficiary name'
),

vw AS (
  SELECT * FROM "2014DE16M2OP001_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP003_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP005_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP006_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP007_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP009_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP011_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP012_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP013_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP014_1"
  UNION ALL
  SELECT * FROM "2014DE16RFOP015_1"
)

SELECT
  *
FROM vw;