DROP TABLE IF EXISTS real.operations_tc;

CREATE TABLE real.operations_tc AS
WITH
"2014TC16I5CB005_1" AS (
  SELECT
    project_title AS operation_name,
    leading_partner AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    project_final_contract_amount::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL > 1.0 THEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    region AS operation_location,
    NULL AS code_of_category_intervention,
    project_intervention_field AS name_of_category_intervention,
    CASE
      WHEN is_numeric("last_modified") THEN to_timestamp_from_excel(TO_NUMBER("last_modified", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("last_modified",'DD.MM.YYYY')::DATE
    END AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    region AS operation_nuts2_name,
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
    project_code AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16I5CB005' AS cci,
    '2014TC16I5CB005_1' AS data_source
  FROM raw."2014TC16I5CB005_1"
),

"2014TC16I5CB006_1" AS (
  SELECT
    project_title AS operation_name,
    leading_partner AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(project_final_contract_amount,'€','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL > 1.0 THEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    region AS operation_location,
    NULL AS code_of_category_intervention,
    project_intervention_field AS name_of_category_intervention,
    CASE
      WHEN is_numeric("last_modified") THEN to_timestamp_from_excel(TO_NUMBER("last_modified", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("last_modified",'DD.MM.YYYY')::DATE
    END AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    region AS operation_nuts2_name,
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
    project_code AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16I5CB006' AS cci,
    '2014TC16I5CB006_1' AS data_source
  FROM raw."2014TC16I5CB006_1"
),

"2014TC16I5CB007_1" AS (
  SELECT
    project_title AS operation_name,
    leading_partner AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(project_final_contract_amount,'€','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL > 1.0 THEN REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(project_eu_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    region AS operation_location,
    NULL AS code_of_category_intervention,
    project_intervention_field AS name_of_category_intervention,
    CASE
      WHEN is_numeric("last_modified") THEN to_timestamp_from_excel(TO_NUMBER("last_modified", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("last_modified",'DD.MM.YYYY')::DATE
    END AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    region AS operation_nuts2_name,
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
    project_code AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16I5CB007' AS cci,
    '2014TC16I5CB007_1' AS data_source
  FROM raw."2014TC16I5CB007_1"
),

"2014TC16I5CB009_1" AS (
  SELECT
    a.project_name_in_english_titlos_ergou AS operation_name,
    b.partner_name_titlos_dikaioukhou AS beneficiary_name,
    a.description_in_english_perigraphe_ergou AS operation_summary,
    CASE
      WHEN is_numeric(a."project_start_date_emeromenia_enarxes_ergou") THEN to_timestamp_from_excel(TO_NUMBER(a."project_start_date_emeromenia_enarxes_ergou", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."project_start_date_emeromenia_enarxes_ergou",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(a."project_end_date_emeromenia_lexes_ergou") THEN to_timestamp_from_excel(TO_NUMBER(a."project_end_date_emeromenia_lexes_ergou", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."project_end_date_emeromenia_lexes_ergou",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    a.project_total_budget_in_eur_sunolikos_pu_ergou::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN a.union_cofinancing_rate_in__koinotike_sukhrematodotese_se_::DECIMAL > 1.0 THEN a.union_cofinancing_rate_in__koinotike_sukhrematodotese_se_::DECIMAL
      ELSE a.union_cofinancing_rate_in__koinotike_sukhrematodotese_se_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    b.country_khora AS country,
    b.nuts_iii_regions_periphereies_nuts_iii AS operation_location,
    a.category_of_intervention_code_kodikos_pediou_parembases AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    b.nuts_iii_regions_periphereies_nuts_iii AS operation_nuts3_name,
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
    '2014TC16I5CB009' AS cci,
    '2014TC16I5CB009_1' AS data_source
  FROM raw."2014TC16I5CB009_1" AS a
  LEFT JOIN raw."2014TC16I5CB009_2" AS b ON a.project_acronym_akronumio_ergou = b.acronym_akronumio AND b.partner_type_tupos_dikaioukhou = 'Lead partner'
  WHERE a.project_name_in_english_titlos_ergou != 'Date of last update: November 6, 2019'
),

"2014TC16M4TN001_1" AS (
  SELECT
    project_label AS operation_name,
    lead_partner AS beneficiary_name,
    operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    amount_of_the_project_erdf_ipa__national_counterpart::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN co_financing_rate::DECIMAL > 1.0 THEN co_financing_rate::DECIMAL
      ELSE co_financing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    postcode AS operation_location,
    objective AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16M4TN001' AS cci,
    '2014TC16M4TN001_1' AS data_source
  FROM raw."2014TC16M4TN001_1"
),

"2014TC16M4TN002_1" AS (
  SELECT
    titletitolo AS operation_name,
    lead_partner_nome_del_capofila AS beneficiary_name,
    operation_summary__sintesi_delloperazione AS operation_summary,
    CASE
      WHEN is_numeric("start_datedata_di_inizio") THEN to_timestamp_from_excel(TO_NUMBER("start_datedata_di_inizio", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_datedata_di_inizio",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_datedata_di_fine") THEN to_timestamp_from_excel(TO_NUMBER("end_datedata_di_fine", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_datedata_di_fine",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_budgetspesa_totale::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN erdf_contributionfesr_confinanziamento LIKE '%,%' THEN REPLACE(REPLACE(REPLACE(erdf_contributionfesr_confinanziamento,'.',''),',','.'),' ','')::DECIMAL / total_budgetspesa_totale::DECIMAL*100.0
      ELSE erdf_contributionfesr_confinanziamento::DECIMAL / total_budgetspesa_totale::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    lp_countrypaese_del_lp AS country,
    participating_countriespaesi_partecipanti AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_categorycategoria_dell_operazione AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    CASE
      WHEN erdf_contributionfesr_confinanziamento LIKE '%,%' THEN REPLACE(REPLACE(REPLACE(erdf_contributionfesr_confinanziamento,'.',''),',','.'),' ','')::DECIMAL
      ELSE erdf_contributionfesr_confinanziamento::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_numbercodice_del_progetto AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16M4TN002' AS cci,
    '2014TC16M4TN002_1' AS data_source
  FROM raw."2014TC16M4TN002_1"
  WHERE is_numeric(start_datedata_di_inizio)
),

"2014TC16M4TN003_1" AS (
  SELECT
    titletitolo AS operation_name,
    lead_partner_nome_del_capofila AS beneficiary_name,
    operation_summary__sintesi_delloperazione AS operation_summary,
    CASE
      WHEN is_numeric("start_datedata_di_inizio") THEN to_timestamp_from_excel(TO_NUMBER("start_datedata_di_inizio", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_datedata_di_inizio",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_datedata_di_fine") THEN to_timestamp_from_excel(TO_NUMBER("end_datedata_di_fine", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_datedata_di_fine",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_budgetspesa_totale::DECIMAL AS operation_total_expenditure,
    erdf_contributionfesr_confinanziamento::DECIMAL / total_budgetspesa_totale::DECIMAL*100.0 AS eu_cofinancing_rate,
    lp_countrypaese_del_lp AS country,
    participating_countriespaesi_partecipanti AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_categorycategoria_dell_operazione AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    erdf_contributionfesr_confinanziamento::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_numbercodice_del_progetto AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16M4TN003' AS cci,
    '2014TC16M4TN003_1' AS data_source
  FROM raw."2014TC16M4TN003_1"
  WHERE is_numeric(start_datedata_di_inizio)
),

"2014TC16M4TN003_2" AS (
  SELECT
    title AS operation_name,
    lead_partner AS beneficiary_name,
    operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_budget::DECIMAL AS operation_total_expenditure,
    erdf_contribution::DECIMAL / total_budget::DECIMAL*100.0 AS eu_cofinancing_rate,
    lp_country AS country,
    partcipating_countries AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_category AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    erdf_contribution::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_number AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16M4TN003' AS cci,
    '2014TC16M4TN003_2' AS data_source
  FROM raw."2014TC16M4TN003_2"
  WHERE is_numeric(start_date)
),

"2014TC16RFCB001_1" AS (
  SELECT
    projektname_projectnaam_nom_du_projet AS operation_name,
    projektpartner_projectpartners_partenaires_du_projet AS beneficiary_name,
    zusammenfassung AS operation_summary,
    CASE
      WHEN is_numeric("von_van_de") THEN to_timestamp_from_excel(TO_NUMBER("von_van_de", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("von_van_de",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("bis_tot_a") THEN to_timestamp_from_excel(TO_NUMBER("bis_tot_a", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("bis_tot_a",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    forderfahige_kosten_subsidiabele_kosten_depenses_eligibles::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _efre__efro__feder::DECIMAL > 1.0 THEN _efre__efro__feder::DECIMAL
      ELSE _efre__efro__feder::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_pays AS country,
    plz_postcode_code_postal AS operation_location,
    NULL AS code_of_category_intervention,
    spezifisches_ziel_speficieke_doelstelling_objectif_specifique name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    plz_postcode_code_postal AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektnr_projectnr_ndeg_du_projet AS operation_id,
    prioritatsachse_prioriteitsas_axe_prioritaire AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB001' AS cci,
    '2014TC16RFCB001_1' AS data_source
  FROM raw."2014TC16RFCB001_1"
),

"2014TC16RFCB001_2" AS (
  SELECT
    projektname_projectnaam_nom_du_projet AS operation_name,
    projektpartner_projectpartners_partenaires_du_projet AS beneficiary_name,
    zusammenfassung AS operation_summary,
    CASE
      WHEN is_numeric("von_van_de") THEN to_timestamp_from_excel(TO_NUMBER("von_van_de", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("von_van_de",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("bis_tot_a") THEN to_timestamp_from_excel(TO_NUMBER("bis_tot_a", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("bis_tot_a",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    forderfahige_kosten_subsidiabele_kosten_depenses_eligibles::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _efre__efro__feder::DECIMAL > 1.0 THEN _efre__efro__feder::DECIMAL
      ELSE _efre__efro__feder::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_pays AS country,
    plz_postcode_code_postal AS operation_location,
    NULL AS code_of_category_intervention,
    spezifisches_ziel_speficieke_doelstelling_objectif_specifique name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    plz_postcode_code_postal AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektnr_projectnr_ndeg_du_projet AS operation_id,
    prioritatsachse_prioriteitsas_axe_prioritaire AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB001' AS cci,
    '2014TC16RFCB001_2' AS data_source
  FROM raw."2014TC16RFCB001_2"
),

"2014TC16RFCB004_1" AS (
  SELECT
    projektname__bezeichnung_des_vorhabens AS operation_name,
    namen_der_begunstigten_institutionen AS beneficiary_name,
    zusammenfassung AS operation_summary,
    CASE
      WHEN is_numeric("projektbeginn") THEN to_timestamp_from_excel(TO_NUMBER("projektbeginn", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("projektbeginn",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("projektende") THEN to_timestamp_from_excel(TO_NUMBER("projektende", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("projektende",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    forderfahige_kosten_des_projektes::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN efresatz::DECIMAL > 1.0 THEN efresatz::DECIMAL
      ELSE efresatz::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    REPLACE(plz_des_projektes__lp,'.0','') AS operation_location,
    interventionskategorie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    REPLACE(plz_des_projektes__lp,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektcode AS operation_id,
    prioritatsachse AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB004' AS cci,
    '2014TC16RFCB004_1' AS data_source
  FROM raw."2014TC16RFCB004_1"
  WHERE projektcode != 'Summe'
),

"2014TC16RFCB006_1" AS (
  SELECT
    titre_du_projet AS operation_name,
    partenaire AS beneficiary_name,
    resume AS operation_summary,
    CASE
      WHEN is_numeric("date_demarrage_du_projet") THEN to_timestamp_from_excel(TO_NUMBER("date_demarrage_du_projet", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_demarrage_du_projet",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin_du_projet") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin_du_projet", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_fin_du_projet",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    addition_du_cout_approuve::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN addition_de__taux_feder_programmee::DECIMAL > 1.0 THEN addition_de__taux_feder_programmee::DECIMAL
      ELSE addition_de__taux_feder_programmee::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pays_nuts_1 AS country,
    provinciadepartement_nuts_3 AS operation_location,
    categorie_dintervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    provinciadepartement_nuts_3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    addition_du_feder_approuve::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    efa AS operation_id,
    axe AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB006' AS cci,
    '2014TC16RFCB006_1' AS data_source
  FROM raw."2014TC16RFCB006_1"
  WHERE provinciadepartement_nuts_3 != 'Total general'
),

"2014TC16RFCB007_1_base" AS (
  SELECT
    codigo,
    eje,
    "pi",
    titulo,
    acronimo,
    coste_total,
    feder_asignado,
    tasa_de_cofinanciacion_de_la_ue,
    fecha_de_inicio,
    fecha_de_finalizacion,
    categoria_de_intervencion
  FROM raw."2014TC16RFCB007_1"
  WHERE titulo IS NOT NULL
),

"2014TC16RFCB007_1_beneficiaries" AS (
  SELECT
    codigo,
    ARRAY_TO_STRING(ARRAY_AGG(regionpais),',','') AS regionpais,
    ARRAY_TO_STRING(ARRAY_AGG(entidad),',','') AS entidad
  FROM raw."2014TC16RFCB007_1"
  WHERE regionpais IS NOT NULL
  GROUP BY 1
),

"2014TC16RFCB007_1_summaries" AS (
  SELECT
    codigo,
    resumen_del_proyecto
  FROM raw."2014TC16RFCB007_1"
  WHERE resumen_del_proyecto IS NOT NULL
),

"2014TC16RFCB007_1" AS (
  SELECT
    b.titulo AS operation_name,
    be.entidad AS beneficiary_name,
    s.resumen_del_proyecto AS operation_summary,
    CASE
      WHEN is_numeric(b."fecha_de_inicio") THEN to_timestamp_from_excel(TO_NUMBER(b."fecha_de_inicio", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(b."fecha_de_inicio",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(b."fecha_de_finalizacion") THEN to_timestamp_from_excel(TO_NUMBER(b."fecha_de_finalizacion", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(b."fecha_de_finalizacion",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_total::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN tasa_de_cofinanciacion_de_la_ue::DECIMAL > 1.0 THEN tasa_de_cofinanciacion_de_la_ue::DECIMAL
      ELSE tasa_de_cofinanciacion_de_la_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    be.regionpais AS country,
    NULL AS operation_location,
    b.categoria_de_intervencion AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    b.feder_asignado::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    b.codigo AS operation_id,
    b."pi" AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB007' AS cci,
    '2014TC16RFCB007_1' AS data_source
  FROM "2014TC16RFCB007_1_base" AS b
  LEFT JOIN "2014TC16RFCB007_1_beneficiaries" AS be ON b.codigo = be.codigo
  LEFT JOIN "2014TC16RFCB007_1_summaries" AS s ON b.codigo = s.codigo
),

"2014TC16RFCB008_1" AS (
  SELECT
    project_title AS operation_name,
    name_of_lead_beneficiary_organisation AS beneficiary_name,
    summary AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'YYYY.MM.DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'YYYY.MM.DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_allocated_expenditure_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinancing_rate_erdf::DECIMAL > 1.0 THEN cofinancing_rate_erdf::DECIMAL
      ELSE cofinancing_rate_erdf::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    specific_objective_component AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    "location" AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    application_form_id AS operation_id,
    investment_priority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB008' AS cci,
    '2014TC16RFCB008_1' AS data_source
  FROM raw."2014TC16RFCB008_1"
  WHERE project_title IS NOT NULL
),

"2014TC16RFCB009_3" AS (
  SELECT
    projektname__nazev_projektu AS operation_name,
    namen_der_begunstigten_institutionen_alle_projektpartner_mit_e AS beneficiary_name,
    projektzusammenfassung__shrnuti_projektu AS operation_summary,
    CASE
      WHEN is_numeric("projektbeginn__zahajeni_projektu") THEN to_timestamp_from_excel(TO_NUMBER("projektbeginn__zahajeni_projektu", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("projektende__ukonceni_projektu") THEN to_timestamp_from_excel(TO_NUMBER("projektende__ukonceni_projektu", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    gesamtes_forderfahiges_budget__celkovy_zpusobily_rozpocet::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN efre__kofinanzierungsrate__dotacni_sazba::DECIMAL > 1.0 THEN efre__kofinanzierungsrate__dotacni_sazba::DECIMAL
      ELSE efre__kofinanzierungsrate__dotacni_sazba::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land__zeme AS country,
    ort_der_projektdurchfuhrung_nuts_regionen_des_programmgebiets_ AS operation_location,
    REPLACE(interventionskategorie__oblast_zasahu,'.0','') code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    ort_der_projektdurchfuhrung_nuts_regionen_des_programmgebiets_ AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    efremittel__prostredky_erdf::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektnr__c_projektu AS operation_id,
    prioritatsachse__prioritni_osa AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB009' AS cci,
    '2014TC16RFCB009_3' AS data_source
  FROM raw."2014TC16RFCB009_3"
  -- TODO: 2014TC16RFCB009_1
  -- and 2014TC16RFCB009_2
  -- seem to be earlier versions
  -- of the data, so excluded.
),

"2014TC16RFCB014_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_beneficiary::DECIMAL AS operation_total_expenditure,
    total_union_cofinancing_allocated_to_the_beneficiary::DECIMAL / GREATEST(total_eligible_expenditure_allocated_to_the_beneficiary::DECIMAL,1)*100.0 AS eu_cofinancing_rate,
    country AS country,
    location_indicator AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_categories AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    location_indicator AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    operation_priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB014' AS cci,
    '2014TC16RFCB014_1' AS data_source
  FROM raw."2014TC16RFCB014_1"
),

"2014TC16RFCB019_1" AS (
  SELECT
    projekttitel AS operation_name,
    leadpartner AS beneficiary_name,
    projektbeschreibung_de AS operation_summary,
    CASE
      WHEN is_numeric("projektbeginn") THEN to_timestamp_from_excel(TO_NUMBER("projektbeginn", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("projektbeginn",'YYYY-MM-DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("projektende") THEN to_timestamp_from_excel(TO_NUMBER("projektende", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("projektende",'YYYY-MM-DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    ausgaben_eur::DECIMAL AS operation_total_expenditure,
    efre_eur::DECIMAL / ausgaben_eur::DECIMAL*100.0 AS eu_cofinancing_rate,
    land AS country,
    plz AS operation_location,
    NULL AS code_of_category_intervention,
    interventionskategorie AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    plz AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    efre_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(projektnr_int,'.0','') AS operation_id,
    prioritatsachse AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB019' AS cci,
    '2014TC16RFCB019_1' AS data_source
  FROM raw."2014TC16RFCB019_1"
),

"2014TC16RFCB023_1" AS (
  SELECT
    projektname AS operation_name,
    projektpartner AS beneficiary_name,
    zusammenfassung_d AS operation_summary,
    CASE
      WHEN is_numeric("laufzeit_von") THEN to_timestamp_from_excel(TO_NUMBER("laufzeit_von", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("laufzeit_von",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("laufzeit_bis") THEN to_timestamp_from_excel(TO_NUMBER("laufzeit_bis", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("laufzeit_bis",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    forderfahige_kosten::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN efre_prioritatsachse::DECIMAL > 1.0 THEN efre_prioritatsachse::DECIMAL
      ELSE efre_prioritatsachse::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land AS country,
    plz AS operation_location,
    interventionskategorie AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    ort AS operation_city,
    NULL AS operation_district,
    plz AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projektnr AS operation_id,
    prioritatsachse AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB023' AS cci,
    '2014TC16RFCB023_1' AS data_source
  FROM raw."2014TC16RFCB023_1"
  WHERE projektnr != 'Projectnr.'
),

"2014TC16RFCB034_1" AS (
  SELECT
    nom_de_loperation AS operation_name,
    nom_du_partenaire AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    cout_total::DECIMAL AS operation_total_expenditure,
    feder::DECIMAL / GREATEST(cout_total::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    pays AS country,
    ville AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    region AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nuts3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    ville AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(code_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    feder::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    REPLACE(axe,'.0','') AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB034' AS cci,
    '2014TC16RFCB034_1' AS data_source
  FROM raw."2014TC16RFCB034_1"
),

"2014TC16RFCB038_1" AS (
  SELECT
    acronym_of_the_operation AS operation_name,
    name_of_the_beneficiary AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_eligible_costs_per_beneficiary::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN percentage_of_erdf_requested_by_the_beneficiary::DECIMAL > 1.0 THEN percentage_of_erdf_requested_by_the_beneficiary::DECIMAL
      ELSE percentage_of_erdf_requested_by_the_beneficiary::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    ms AS country,
    nuts_iii AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nuts_iii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    erdf_committed_per_beneficiary::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_registration_number AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB038' AS cci,
    '2014TC16RFCB038_1' AS data_source
  FROM raw."2014TC16RFCB038_1"
),

"2014TC16RFCB039_1" AS (
  SELECT
    nom_du_projet AS operation_name,
    porteur_de_projet AS beneficiary_name,
    description_du_projet AS operation_summary,
    CASE
      WHEN is_numeric("debut_du_projet") THEN to_timestamp_from_excel(TO_NUMBER("debut_du_projet", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("debut_du_projet",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_du_projet_projektende") THEN to_timestamp_from_excel(TO_NUMBER("fin_du_projet_projektende", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fin_du_projet_projektende",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    cout_eligible::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _feder_axe_prioritaire::DECIMAL > 1.0 THEN _feder_axe_prioritaire::DECIMAL
      ELSE _feder_axe_prioritaire::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    situation_gegographique_du_porteur_de_projet AS country,
    lieu AS operation_location,
    REPLACE(domaine_dintervention,'.0','') AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    lieu AS operation_city,
    NULL AS operation_district,
    code_postal AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    feder::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    ndeg_projet AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB039' AS cci,
    '2014TC16RFCB039_1' AS data_source
  FROM raw."2014TC16RFCB039_1"
  WHERE ndeg_projet NOT IN  ('Projektnummer', 'Axe prioritaire A / Prioritätsachse A Axe prioritaire A / Prioritätsachse A ')
-- TODO: Tabs on this source seem to be
-- versioning of updates according to dates,
-- while this sheet contains all data.
-- Therefore 2014TC16RFCB039_1 to 2014TC16RFCB039_15 
-- are excluded.
),

"2014TC16RFCB041_1" AS (
  SELECT
    nom_du_projet AS operation_name,
    chef_de_file_fr AS beneficiary_name,
    description AS operation_summary,
    CASE
      WHEN is_numeric("date_de_debut") THEN to_timestamp_from_excel(TO_NUMBER("date_de_debut", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_debut",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_fin",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_general_eur::DECIMAL AS operation_total_expenditure,
    feder_eur::DECIMAL / total_general_eur::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    localisation_fr||'//'||localisation_ch AS operation_location,
    NULL AS code_of_category_intervention,
    categorie_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    localisation_fr||'//'||localisation_ch AS operation_lau2_name,
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
    '2014TC16RFCB041' AS cci,
    '2014TC16RFCB041_1' AS data_source
  FROM raw."2014TC16RFCB041_1"
),

"2014TC16RFCB045_1" AS (
  SELECT
    titre_du_projet__projektbezeichnung AS operation_name,
    beneficiaire_chef_de_file__federfuhrender_begunstigter AS beneficiary_name,
    description_courte_ AS operation_summary,
    CASE
      WHEN is_numeric("date_de_debut__datum_des_projektbeginns") THEN to_timestamp_from_excel(TO_NUMBER("date_de_debut__datum_des_projektbeginns", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin__datum_des_projektendes") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin__datum_des_projektendes", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    montant_total_eligible_du_projet__forderfahiger_gesamtbetrag_d::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _feder_axe_prioritaire___efre_prioritatsachse::DECIMAL > 1.0 THEN _feder_axe_prioritaire___efre_prioritatsachse::DECIMAL
      ELSE _feder_axe_prioritaire___efre_prioritatsachse::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pays__land AS country,
    lieu__ort operation_location,
    REPLACE(domaine_dintervention__interventionsbereich,'.0','') AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    lieu__ort AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(code_postal__postleitzahl,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    feder__efre::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ndeg_de_projet__projektnummer AS operation_id,
    priorite__prioritatsachse AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    activite_economique__wirtschaftszweig AS economic_dimension,
    '2014TC16RFCB045' AS cci,
    '2014TC16RFCB045_1' AS data_source
  FROM raw."2014TC16RFCB045_1"
  WHERE titre_du_projet__projektbezeichnung IS NOT NULL
),

"2014TC16RFCB046_1" AS (
  SELECT
    a.titel_van_het_project_operation_name AS operation_name,
    b.naam_partner_beneficiary AS beneficiary_name,
    a.samenvatting_nl_operation_summary AS operation_summary,
    CASE
      WHEN is_numeric(a."begindatum_start_date") THEN to_timestamp_from_excel(TO_NUMBER(a."begindatum_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."begindatum_start_date",'DD/MM/YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(a."einddatum_end_date") THEN to_timestamp_from_excel(TO_NUMBER(a."einddatum_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."einddatum_end_date",'DD/MM/YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    a.totale_kosten_in_euros_total_eligible_expenditure_in_euros::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN a.efro__erdf_rate::DECIMAL > 1.0 THEN a.efro__erdf_rate::DECIMAL
      ELSE a.efro__erdf_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    b.land_country AS country,
    b.nuts_iii AS operation_location,
    a.steunverleningsgebied_intervention_field_dimension AS code_of_category_intervention,
    a.naam_categorie_steunverlening_name_of_category_of_intervention AS name_of_category_intervention,
    CASE
      WHEN is_numeric(a."datum_van_laatste_bijwerking_date_of_last_update") THEN to_timestamp_from_excel(TO_NUMBER(a."datum_van_laatste_bijwerking_date_of_last_update", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."datum_van_laatste_bijwerking_date_of_last_update",'DD/MM/YYYY')::DATE
    END AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    b.plaats_locality AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    b.nuts_iii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    b.postcode_zipcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    a.eusubsidie_in_euros_erdf_grant_in_euros::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB046' AS cci,
    '2014TC16RFCB046_1' AS data_source
  FROM raw."2014TC16RFCB046_1" AS a
  LEFT JOIN raw."2014TC16RFCB046_2" AS b ON a.titel_van_het_project_operation_name = b.titel_van_het_project_operation_name
    AND b.projectverantwoordelijke_lead_partner = 'JA'
),

"2014TC16RFCB047_1" AS (
  SELECT
    operationproject_name AS operation_name,
    beneficiarylead_partner_name AS beneficiary_name,
    operationproject_summary AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_project_cost_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_::DECIMAL > 1.0 THEN union_cofinancing_rate_::DECIMAL
      ELSE union_cofinancing_rate_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode AS operation_location,
    category_of_intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    total_erdf_allocated_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_ref AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB047' AS cci,
    '2014TC16RFCB047_1' AS data_source
  FROM raw."2014TC16RFCB047_1"
),

"2014TC16RFCB048_1" AS (
  SELECT
    operation_idea_title AS operation_name,
    lead_beneficiary AS beneficiary_name,
    brief_synopsis AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'DD.MM.YY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'DD.MM.YY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_cost_m::DECIMAL*1000000.0 AS operation_total_expenditure,
    ((erdf_m::DECIMAL*1000000.0) / (total_cost_m::DECIMAL*1000000.0))*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    erdf_m::DECIMAL*1000000.0 AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(case_number,'.0','') AS operation_id,
    priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB048' AS cci,
    '2014TC16RFCB048_1' AS data_source
  FROM raw."2014TC16RFCB048_1"
),

"2014TC16RFCB050_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date",'YYYY-MM-DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date",'YYYY-MM-DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinancingrate::DECIMAL > 1.0 THEN cofinancingrate::DECIMAL
      ELSE cofinancingrate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    nutslabel AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nutslabel AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    erdf::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    investment_priority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB050' AS cci,
    '2014TC16RFCB050_1' AS data_source
  FROM raw."2014TC16RFCB050_1"
),

"2014TC16RFCB053_3" AS (
  SELECT
    project_name AS operation_name,
    lead_partner AS beneficiary_name,
    project_summary AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_project_in_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL > 1.0 THEN eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL
      ELSE eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    postcode AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    city AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    allocated_erdf_funds_in_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB053' AS cci,
    '2014TC16RFCB053_3' AS data_source
  FROM raw."2014TC16RFCB053_3"
  -- TODO: 2014TC16RFCB053_1 and
  -- 2014TC16RFCB053_2 seem to be
  -- translations of the same data
  -- so are excluded!
  WHERE project_partners IS NULL
),

"2014TC16RFCB054_3" AS (
  SELECT
    project_name AS operation_name,
    lead_partner AS beneficiary_name,
    project_summary AS operation_summary,
    CASE
      WHEN is_numeric("project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_project_in_eur::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL > 1.0 THEN eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL
      ELSE eu_cofinancing_rate_in__as_per_priority_axis::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    postcode AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    city AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    allocated_erdf_funds_in_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB054' AS cci,
    '2014TC16RFCB054_3' AS data_source
  FROM raw."2014TC16RFCB054_3"
  -- TODO: 2014TC16RFCB054_1 and
  -- 2014TC16RFCB054_2 seem to be
  -- translations of the same data
  -- so are excluded!
  WHERE project_partners IS NULL
    AND is_numeric(total_eligible_expenditure_allocated_to_the_project_in_eur)
),

"2014TC16RFCB055_1" AS (
  SELECT
    a.project_name_in_english AS operation_name,
    b.institution_name_en AS beneficiary_name,
    a.description_in_english AS operation_summary,
    CASE
      WHEN is_numeric(a."project_start_date") THEN to_timestamp_from_excel(TO_NUMBER(a."project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(a."project_end_date") THEN to_timestamp_from_excel(TO_NUMBER(a."project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    CASE
      WHEN a.project_total_budget LIKE '%,%' THEN REPLACE(REPLACE(a.project_total_budget,'.',''),',','.')::DECIMAL
      WHEN SUBSTRING(a.project_total_budget,2,1) = '.' THEN REPLACE(a.project_total_budget,'.','')::DECIMAL
      ELSE a.project_total_budget::DECIMAL
    END AS operation_total_expenditure,
    CASE
      WHEN a.union_cofinancing_rate_in_::DECIMAL > 1.0 THEN union_cofinancing_rate_in_::DECIMAL
      ELSE union_cofinancing_rate_in_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    b.country AS country,
    REPLACE(b.postcode,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    a.contribution_to_the_programmes_specific_objective AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    b.town AS operation_city,
    NULL AS operation_district,
    REPLACE(b.postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    CASE
      WHEN a.project_eu_funding LIKE '%,%' THEN REPLACE(REPLACE(a.project_eu_funding,'.',''),',','.')::DECIMAL
      WHEN SUBSTRING(a.project_eu_funding,2,1) = '.' THEN REPLACE(a.project_total_budget,'.','')::DECIMAL
      ELSE a.project_eu_funding::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    a.priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    a.theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFCB055' AS cci,
    '2014TC16RFCB055_1' AS data_source
  FROM raw."2014TC16RFCB055_1" AS a
  LEFT JOIN raw."2014TC16RFCB055_2" AS b ON a.aa = b.aa
    AND a.project_acronym = b.acronym
    AND LOWER(b.partner_type) = 'lead partner'
),

"2014TC16RFIR001_1" AS (
  SELECT
    operation_name__acronyme_du_projet AS operation_name,
    beneficiary_name__nom_du_beneficiaire AS beneficiary_name,
    operation_summary__resume_du_projet AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date__date_de_debut_du_projet") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date__date_de_debut_du_projet", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date__date_de_debut_du_projet",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date__date_de_fin_du_projet") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date__date_de_fin_du_projet", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date__date_de_fin_du_projet",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_operation__montant::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_as_per_priority_axes__taux_de_cofinance::DECIMAL > 1.0 THEN union_cofinancing_rate_as_per_priority_axes__taux_de_cofinance::DECIMAL
      ELSE union_cofinancing_rate_as_per_priority_axes__taux_de_cofinance::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country__pays AS country,
    operation_post_code__code_postal AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_category_of_intervention__nom_de_la_categorie_dinterve AS name_of_category_intervention,
    CASE
      WHEN is_numeric("date_of_last_update__date_de_derniere_mise_a_jour") THEN to_timestamp_from_excel(TO_NUMBER(LEFT("date_of_last_update__date_de_derniere_mise_a_jour",7), '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_of_last_update__date_de_derniere_mise_a_jour",'DD.MM.YYYY')::DATE
    END AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    operation_post_code__code_postal AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    index__indice AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFIR001' AS cci,
    '2014TC16RFIR001_1' AS data_source
  FROM raw."2014TC16RFIR001_1"
),

"2014TC16RFPC001_1" AS (
  SELECT
    operationproject_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operationproject_summary AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(total_project_cost_eurps,'€',''),',','')) THEN REPLACE(REPLACE(total_project_cost_eurps,'€',''),',','')::DECIMAL
      ELSE NULL::DECIMAL 
    END AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_::DECIMAL > 1.0 THEN union_cofinancing_rate_::DECIMAL
      ELSE union_cofinancing_rate_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode AS operation_location,
    category_of_intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(total_erdf_allocated_eurps,'€',''),',','')) THEN REPLACE(REPLACE(total_erdf_allocated_eurps,'€',''),',','')::DECIMAL
      ELSE NULL::DECIMAL 
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ems_ref AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFPC001' AS cci,
    '2014TC16RFPC001_1' AS data_source
  FROM raw."2014TC16RFPC001_1"
),

"2014TC16RFTN002_1" AS (
  SELECT
    operation_name AS operation_name,
    lead_partner_name AS beneficiary_name,
    summary AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'YYYY-MM-DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'YYYY-MM-DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_of_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    erdf_expenditure_allocated::DECIMAL / total_of_eligible_expenditure::DECIMAL*100.0 AS eu_cofinancing_rate,
    country AS country,
    lead_partner_location_region AS operation_location,
    NULL AS code_of_category_intervention,
    programme_specific_objective AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    lead_partner_location_region AS operation_nuts1_name,
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
    erdf_expenditure_allocated::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    operation_code_nr AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFTN002' AS cci,
    '2014TC16RFTN002_1' AS data_source
  FROM raw."2014TC16RFTN002_1"
  WHERE acronym NOT IN ('Acrónimo','Acronyme','Acrónimo')
),

"2014TC16RFTN003_1" AS (
  SELECT
    a.operation_name AS operation_name,
    a.beneficiary_name_in_english AS beneficiary_name,
    a.operation_summary AS operation_summary,
    CASE
      WHEN is_numeric(a."operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER(a."operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."operation_start_date",'DD/MM/YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric(a."operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER(a."operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE(a."operation_end_date",'DD/MM/YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    a.total_eligible_expenditure_allocated_to_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN a.union_cofinancing_rate_in_::DECIMAL > 1.0 THEN a.union_cofinancing_rate_in_::DECIMAL
      ELSE a.union_cofinancing_rate_in_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    b.country AS country,
    REPLACE(b.operation_postcode,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    a.programme__operation_specific_objective AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    b.nuts1 AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    b.nuts2 AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    b.nuts3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    b.town AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(b.operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    a.priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFTN003' AS cci,
    '2014TC16RFTN003_1' AS data_source
  FROM raw."2014TC16RFTN003_1" AS a
  LEFT JOIN raw."2014TC16RFTN003_2" AS b ON a.operation_name = b.operation_name
    AND a.beneficiary_name  = b.beneficiary_name 
),

"2014TC16RFTN006_1" AS (
  SELECT
    operation_name_nom_de_loperation_bezeichnung_des_vorhabens_naa AS operation_name,
    beneficiary_name_nom_du_benefictiaire_name_des_begunstigten_na AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_beneficiary_total_::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_taux_de_cofinancement_par_lunion_unions::DECIMAL > 1.0 THEN union_cofinancing_rate_taux_de_cofinancement_par_lunion_unions::DECIMAL
      ELSE union_cofinancing_rate_taux_de_cofinancement_par_lunion_unions::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country_pays_land_land AS country,
    operation_post_code_code_postal_de_loperation_postleitzahl_des AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_category_of_intervention_for_the_operation_in_accordan AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    nuts_code_code_nuts_nuts_code_nuts_code AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    operation_post_code_code_postal_de_loperation_postleitzahl_des AS operation_zip_code,
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
    '2014TC16RFTN006' AS cci,
    '2014TC16RFTN006_1' AS data_source
  FROM raw."2014TC16RFTN006_1"
),

"2014TC16RFTN007_1" AS (
  SELECT
    operation_name_nombre_de_la_operacion_nom_de_loperation_nome_d AS operation_name,
    beneficiary_name_nombre_del_beneficiario_nom_du_beneficiaire_n AS beneficiary_name,
    operation_summary_resumen_de_la_operacion_resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("operation_start_date_fecha_de_inicio_de_la_operacion_date_de_d") THEN to_timestamp_from_excel(TO_NUMBER("operation_start_date_fecha_de_inicio_de_la_operacion_date_de_d", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_start_date_fecha_de_inicio_de_la_operacion_date_de_d",'DD/MM/YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("operation_end_date_fecha_de_conclusion_de_la_operacion_date_de") THEN to_timestamp_from_excel(TO_NUMBER("operation_end_date_fecha_de_conclusion_de_la_operacion_date_de", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("operation_end_date_fecha_de_conclusion_de_la_operacion_date_de",'DD/MM/YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_beneficiary_gasto_::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_porcentaje_de_cofinanciacion_de_la_unio::DECIMAL > 1.0 THEN union_cofinancing_rate_porcentaje_de_cofinanciacion_de_la_unio::DECIMAL
      ELSE union_cofinancing_rate_porcentaje_de_cofinanciacion_de_la_unio::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country_pais_pays_pais AS country,
    region_nuts_ii_region_nuts_ii_region_nuts_ii_regiao_nuts_ii AS operation_location,
    NULL AS code_of_category_intervention,
    category_of_intervention_for_the_operation_categoria_de_interv AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    region_nuts_ii_region_nuts_ii_region_nuts_ii_regiao_nuts_ii AS operation_nuts2_name,
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
    erdf_allocated_to_the_beneficiary_ayuda_feder_asignada_al_bene::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_code_codigo_proyecto_code_projet_codigo_projeto AS operation_id,
    sudoe_priority_axis_eje_prioritario_sudoe_axe_prioritaire_sudo AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFTN007' AS cci,
    '2014TC16RFTN007_1' AS data_source
  FROM raw."2014TC16RFTN007_1"
),

"2014TC16RFTN009_1" AS (
  SELECT
    operation__operation AS operation_name,
    beneficiaire__beneficiary AS beneficiary_name,
    resume_de_loperation__summary AS operation_summary,
    CASE
      WHEN is_numeric("debut_dexecution_start_date") THEN to_timestamp_from_excel(TO_NUMBER("debut_dexecution_start_date", '99999D9')::INTEGER)::DATE
      WHEN "debut_dexecution_start_date" = 'Déprogrammation validée le 28/05/2019' THEN '2019-05-28'::DATE
      ELSE TO_DATE("debut_dexecution_start_date",'YYYY/MM/DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_dexecution__end_date") THEN to_timestamp_from_excel(TO_NUMBER("fin_dexecution__end_date", '99999D9')::INTEGER)::DATE
       WHEN "fin_dexecution__end_date" = 'Déprogrammation validée le 28/05/2019' THEN '2019-05-28'::DATE
      ELSE TO_DATE("fin_dexecution__end_date",'YYYY/MM/DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles__total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN taux_cofinancement_ue__union_cofinancing_rate::DECIMAL > 1.0 THEN taux_cofinancement_ue__union_cofinancing_rate::DECIMAL
      ELSE taux_cofinancement_ue__union_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    ville__city AS operation_location,
    NULL AS code_of_category_intervention,
    categorie_dintervention__category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'TC' AS operation_nuts0,
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
    REPLACE(cp__zip,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    ue__eu::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014TC16RFTN009' AS cci,
    '2014TC16RFTN009_1' AS data_source
  FROM raw."2014TC16RFTN009_1"
),

vw AS (
  SELECT * FROM "2014TC16I5CB005_1"
  UNION ALL
  SELECT * FROM "2014TC16I5CB006_1"
  UNION ALL
  SELECT * FROM "2014TC16I5CB007_1"
  UNION ALL
  SELECT * FROM "2014TC16I5CB009_1"
  UNION ALL
  SELECT * FROM "2014TC16M4TN001_1"
  UNION ALL
  SELECT * FROM "2014TC16M4TN002_1"
  UNION ALL
  SELECT * FROM "2014TC16M4TN003_1"
  UNION ALL
  SELECT * FROM "2014TC16M4TN003_2"
  UNION ALL
  SELECT * FROM "2014TC16RFCB001_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB001_2"
  UNION ALL
  SELECT * FROM "2014TC16RFCB004_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB006_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB007_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB008_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB009_3"
  UNION ALL
  SELECT * FROM "2014TC16RFCB014_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB019_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB023_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB034_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB038_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB039_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB041_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB045_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB046_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB047_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB048_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB050_1"
  UNION ALL
  SELECT * FROM "2014TC16RFCB053_3"
  UNION ALL
  SELECT * FROM "2014TC16RFCB054_3"
  UNION ALL
  SELECT * FROM "2014TC16RFCB055_1"
  UNION ALL
  SELECT * FROM "2014TC16RFIR001_1"
  UNION ALL
  SELECT * FROM "2014TC16RFPC001_1"
  UNION ALL
  SELECT * FROM "2014TC16RFTN002_1"
  UNION ALL
  SELECT * FROM "2014TC16RFTN003_1"
  UNION ALL
  SELECT * FROM "2014TC16RFTN006_1"
  UNION ALL
  SELECT * FROM "2014TC16RFTN007_1"
  UNION ALL
  SELECT * FROM "2014TC16RFTN009_1"
)

SELECT
  *
FROM vw;
