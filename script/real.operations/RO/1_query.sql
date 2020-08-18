DROP TABLE IF EXISTS real.operations_ro;

CREATE TABLE real.operations_ro AS
WITH
"2014RO_1" AS (
  SELECT DISTINCT
    _titlu_proiect AS operation_name,
    nume_beneficiar AS beneficiary_name,
    NULL::TEXT AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_valoare_proiecte_ro,'None','0.0')::DECIMAL AS operation_total_expenditure,
    REPLACE(fonduri_ue_ro,'None','0.0')::DECIMAL / REPLACE(total_valoare_proiecte_ro,'None','0.0')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    REPLACE(fonduri_ue_ro,'None', '0.0')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    nr_crt AS operation_id,
    prioritate AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_1' AS data_source
  FROM raw."2014RO_1"
  WHERE nr_crt != 'None'
),

"2014RO_2" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    nume_beneficiar AS beneficiary_name,
    NULL::TEXT AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_valoare_proiect_euro::DECIMAL AS operation_total_expenditure,
    fedr::DECIMAL / total_valoare_proiect_euro::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    nume_prioritate_de_investitii_din_care_se_finanteaza AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    fedr::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    cod_proiect AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_2' AS data_source
  FROM raw."2014RO_2"
  WHERE nr_crt != 'Nr. crt'
),

"2014RO_3" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    nume_beneficiar_lead_partner_si_parteneri AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_valoare_contract::DECIMAL AS operation_total_expenditure,
    fonduri_ue_eni::DECIMAL / total_valoare_contract::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    fonduri_ue_eni::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_3' AS data_source
  FROM raw."2014RO_3"
  WHERE nume_beneficiar_lead_partner_si_parteneri NOT IN ('Nume Beneficiar (Lead Partner si Parteneri)','4.0')
),

"2014RO_5" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    beneficiari AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    ipa_beneficiar::DECIMAL / total_valoare_proiect::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    ipa_beneficiar::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    nr_crt AS operation_id,
    axaobiectiv AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_5' AS data_source
  FROM raw."2014RO_5"
  WHERE nr_crt != 'Nr. Crt'
),

"2014RO_6" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    nume_beneficiar_lead_partner_si_parteneri AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_valoare_contract::DECIMAL AS operation_total_expenditure,
    fonduri_ue_eni::DECIMAL / total_valoare_contract::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    fonduri_ue_eni::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    nr_crt AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_6' AS data_source
  FROM raw."2014RO_6"
  WHERE titlu_proiect NOT IN ('Titlu proiect', '3.0')
),

"2014RO_7" AS (
  SELECT DISTINCT
    denumire_proiect AS operation_name,
    nume_beneficiar_ro_in_proiect AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    fonduri_ue_aferent_parteneri_ro::DECIMAL / total_valoare_proiect::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
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
    cod_proiect AS operation_id,
    nume_prioritate_de_investitii_din_care_se_finanteaza AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_7' AS data_source
  FROM raw."2014RO_7"
),

"2014RO_8" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    denumire_beneficiar AS beneficiary_name,
    rezumat_proiect AS operation_summary,
    CASE
      WHEN "data_de_incepere_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_incepere_a_proiectului",10),'YYYY-MM-DD')
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN "data_de_finalizare_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_finalizare_a_proiectului",10),'YYYY-MM-DD')
      ELSE NULL::DATE
    END AS operation_end_date,
    'LEI' AS currency,
    total_valoare_proiect_lei::DECIMAL AS operation_total_expenditure,
    fonduri_ue::DECIMAL / total_valoare_proiect_lei::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    localitate AS operation_location,
    categorie_de_interventie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localitate AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fonduri_ue::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    cod_proiect AS operation_id,
    axa_prioritara_prioritate_de_investitii AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_8' AS data_source
  FROM raw."2014RO_8"
  WHERE nr_crt != 'Nr. crt.'
),

"2014RO_10" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    denumire_beneficiar AS beneficiary_name,
    rezumat_proiect AS operation_summary,
    CASE
      WHEN "data_de_incepere_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_incepere_a_proiectului",10),'YYYY-MM-DD')
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN "data_de_finalizare_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_finalizare_a_proiectului",10),'YYYY-MM-DD')
      ELSE NULL::DATE
    END AS operation_end_date,
    'LEI' AS currency,
    -- TODO: CURRENCY IS NOT CONFIRMED, TO BE CHECKED!
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL > 1.0 THEN REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL
      ELSE REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    localitate AS operation_location,
    categorie_de_interventie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localitate AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    finantare_acordata::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    id AS operation_id,
    axa_prioritara_prioritate_de_investitii AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_10' AS data_source
  FROM raw."2014RO_10"
  WHERE nr_crt != 'Nr. crt.'
),

"2014RO_12" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    denumire_beneficiar AS beneficiary_name,
    rezumat_proiect AS operation_summary,
    CASE
      WHEN is_numeric("data_de_incepere_a_proiectului") THEN to_timestamp_from_excel(TO_NUMBER("data_de_incepere_a_proiectului", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_de_finalizare_a_proiectului") THEN to_timestamp_from_excel(TO_NUMBER("data_de_finalizare_a_proiectului", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'LEI' AS currency,
    -- TODO: CURRENCY IS NOT CONFIRMED, TO BE CHECKED!
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL > 1.0 THEN REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL
      ELSE REPLACE(rata_de_cofinantare_ue,',','.')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    localitate AS operation_location,
    categorie_de_interventie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localitate AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fonduri_ue::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    axa_prioritara_prioritate_de_investitii AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_12' AS data_source
  FROM raw."2014RO_12"
  WHERE axa_prioritara_prioritate_de_investitii != '2.0'
    AND LOWER(axa_prioritara_prioritate_de_investitii) NOT LIKE '%total%'
),

"2014RO_13" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    nume_beneficiar AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'LEI' AS currency,
    -- TODO: CURRENCY IS NOT CONFIRMED, TO BE CHECKED!
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    fonduri_ue::DECIMAL / total_valoare_proiect::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    localitate_pentru_beneficiar AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune_pentru_beneficiar AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet_pentru_beneficiar AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localitate_pentru_beneficiar AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fonduri_ue::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(smisnr_inregistrare,'.0','') AS operation_id,
    axa_prioritaraprioritate_de_investitiiobiectiv_specific AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_13' AS data_source
  FROM raw."2014RO_13"
),

"2014RO_18" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    nume_beneficiar AS beneficiary_name,
    rezumat_proiect AS operation_summary,
    CASE
      WHEN "data_de_incepere_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_incepere_a_proiectului",10),'YYYY-MM-DD')
      WHEN "data_de_incepere_a_proiectului" ~ '[0-3]{1}[0-9]{1}.[0-1]{1}[0-9]{1}.[0-9]{4}' AND LEFT("data_de_incepere_a_proiectului",5) NOT IN ('31.02', 'CF se', '24.15') THEN TO_DATE(LEFT("data_de_incepere_a_proiectului",10),'DD.MM.YYYY')
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN "data_de_finalizare_a_proiectului" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE(LEFT("data_de_finalizare_a_proiectului",10),'YYYY-MM-DD')
      WHEN "data_de_finalizare_a_proiectului" ~ '[0-3]{1}[0-9]{1}.[0-1]{1}[0-9]{1}.[0-9]{4}' AND LEFT("data_de_finalizare_a_proiectului",5) NOT IN ('31.02', 'CF se', '24.15') THEN TO_DATE(LEFT("data_de_finalizare_a_proiectului",10),'DD.MM.YYYY')
      ELSE NULL::DATE
    END AS operation_start_date,
    'LEI' AS currency,
    -- TODO: CURRENCY IS NOT CONFIRMED, TO BE CHECKED!
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN rata_de_cofinantare_ue::DECIMAL > 1.0 THEN rata_de_cofinantare_ue::DECIMAL
      ELSE rata_de_cofinantare_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    localitate AS operation_location,
    categorie_de_interventie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localitate AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fonduri_ue::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(cod_smis,'.0','') AS operation_id,
    axa_prioritaraprioritate_de_investitiiobiectiv_specific AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_18' AS data_source
  FROM raw."2014RO_18"
  WHERE axa_prioritaraprioritate_de_investitiiobiectiv_specific != 'AP 1'
),

"2014RO_19" AS (
  SELECT DISTINCT
    titlu_proiect AS operation_name,
    denumire_beneficiar AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_start_date,
    'LEI' AS currency,
    -- TODO: CURRENCY IS NOT CONFIRMED, TO BE CHECKED!
    total_valoare_proiect::DECIMAL AS operation_total_expenditure,
    fonduri_ue::DECIMAL / total_valoare_proiect::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    judet AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'RO' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    regiune AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    judet AS operation_nuts2_name,
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
    fonduri_ue::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(cod_smis__nr_inregistrare,'.0','') AS operation_id,
    axa_prioritara_prioritate_de_investitii AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014RO' AS cci,
    '2014RO_19' AS data_source
  FROM raw."2014RO_19"
),

vw AS (
  SELECT * FROM "2014RO_1"
  UNION ALL
  SELECT * FROM "2014RO_2"
  UNION ALL
  SELECT * FROM "2014RO_3"
  UNION ALL
  SELECT * FROM "2014RO_5"
  UNION ALL
  SELECT * FROM "2014RO_6"
  UNION ALL
  SELECT * FROM "2014RO_7"
  UNION ALL
  SELECT * FROM "2014RO_8"
  UNION ALL
  SELECT * FROM "2014RO_10"
  UNION ALL
  SELECT * FROM "2014RO_12"
  UNION ALL
  SELECT * FROM "2014RO_13"
  UNION ALL
  SELECT * FROM "2014RO_18"
  UNION ALL
  SELECT * FROM "2014RO_19"
)

SELECT
  *
FROM vw;
