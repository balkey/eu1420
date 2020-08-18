DROP TABLE IF EXISTS real.operations_fr;

CREATE TABLE real.operations_fr AS
WITH
"2014FR05M0OP001_1" AS (
  SELECT
    nom_de_loperation__operation_name AS operation_name,
    nom_du_beneficiaire__beneficiary_name AS beneficiary_name,
    resume_de_loperation__operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("date_du_debut_de_loperation__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("date_du_debut_de_loperation__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_du_debut_de_loperation__operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin_de_loperation__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin_de_loperation__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_fin_de_loperation__operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles_attribue_a_loperation__total_elig::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN taux_de_cofinancement_par_lunion_europeenne__union_cofinancing::DECIMAL > 1.0 THEN taux_de_cofinancement_par_lunion_europeenne__union_cofinancing::DECIMAL
      ELSE taux_de_cofinancement_par_lunion_europeenne__union_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    emplacement_de_loperation__operation_location_indicator AS operation_location,
    NULL AS code_of_category_intervention,
    denomination_de_la_categorie_dintervention_dont_releve_loperat AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    REPLACE(departement__territory,'.0','') AS operation_nuts3_code,
    emplacement_de_loperation__operation_location_indicator AS operation_nuts3_name,
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
    '2014FR05M0OP001' AS cci,
    '2014FR05M0OP001_1' AS data_source
  FROM raw."2014FR05M0OP001_1"
),

"2014FR16M0OP004_1" AS (
  SELECT
    intitule_du_projet AS operation_name,
    nom_du_beneficiaire AS beneficiary_name,
    resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("date_de_debut_de_loperation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_debut_de_loperation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_debut_de_loperation",'DD/MM/YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_programmation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_programmation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_programmation",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles::DECIMAL AS operation_total_expenditure,
    montant_ue_programme::DECIMAL / (total_des_depenses_eligibles::DECIMAL+montant_ue_programme::DECIMAL)*100.0 AS eu_cofinancing_rate,
    pays AS country,
    COALESCE(code_postal_de_loperation, region_de_loperation) AS operation_location,
    NULL AS code_of_category_intervention,
    domaine_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    departement_de_loperation AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    region_de_loperation AS operation_city,
    NULL AS operation_district,
    code_postal_de_loperation AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    montant_ue_programme::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M0OP004' AS cci,
    '2014FR16M0OP004_1' AS data_source
  FROM raw."2014FR16M0OP004_1"
),

"2014FR16M0OP006_1" AS (
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
    total_cost::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eu_cofinancement_rate::DECIMAL > 1.0 THEN eu_cofinancement_rate::DECIMAL
      ELSE eu_cofinancement_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    precise_localisation AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%région%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%département%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%commune%' THEN precise_localisation
      ELSE NULL
    END AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    eu_part::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M0OP006' AS cci,
    '2014FR16M0OP006_1' AS data_source
  FROM raw."2014FR16M0OP006_1"
  WHERE country != 'Pays'
),

"2014FR16M0OP007_1" AS (
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
    total_cost::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eu_cofinancement_rate::DECIMAL > 1.0 THEN eu_cofinancement_rate::DECIMAL
      ELSE eu_cofinancement_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    precise_localisation AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%région%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%département%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%commune%' OR LOWER(precise_localisation) LIKE '%adresse%' THEN precise_localisation
      ELSE NULL
    END AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(zip_code,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    eu_part::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M0OP007' AS cci,
    '2014FR16M0OP007_1' AS data_source
  FROM raw."2014FR16M0OP007_1"
  WHERE country != 'Pays'
),

"2014FR16M0OP011_1" AS (
  SELECT
    intitule_de_loperation AS operation_name,
    beneficiares AS beneficiary_name,
    NULL::TEXT AS operation_summary,
    NULL::DATE AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_programmation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_programmation", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    cout_total::DECIMAL AS operation_total_expenditure,
    montant_ue_programme::DECIMAL / GREATEST((cout_total::DECIMAL+montant_ue_programme::DECIMAL),1.0)*100.0 AS eu_cofinancing_rate,
    NULL::TEXT AS country,
    REPLACE(departement_de_loperation,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    domaine_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    REPLACE(departement_de_loperation,'.0','') AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    montant_ue_programme::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    numcci AS cci,
    '2014FR16M0OP011_1' AS data_source
  FROM raw."2014FR16M0OP011_1"
),

"2014FR16M0OP014_1" AS (
  SELECT
    libelle_du_dossier AS operation_name,
    beneficiaire AS beneficiary_name,
    resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("debut_previsionnel_doperation") THEN to_timestamp_from_excel(TO_NUMBER("debut_previsionnel_doperation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("debut_previsionnel_doperation",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_previsionnelle_doperation") THEN to_timestamp_from_excel(TO_NUMBER("fin_previsionnelle_doperation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fin_previsionnelle_doperation",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    cout_total_programme::DECIMAL AS operation_total_expenditure,
    montant_ue_programme::DECIMAL / GREATEST((cout_total_programme::DECIMAL+montant_ue_programme::DECIMAL),1.0)*100.0 AS eu_cofinancing_rate,
    NULL::TEXT AS country,
    REPLACE(liste_dep,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    domaine_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    REPLACE(liste_dep,'.0','') AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    montant_ue_programme::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M0OP014' AS cci,
    '2014FR16M0OP014_1' AS data_source
  FROM raw."2014FR16M0OP014_1"
  WHERE libelle_du_dossier != 'Operation name'
),

"2014FR16M0OP015_1" AS (
  SELECT
    intitule_du_projet_name_of_the_project AS operation_name,
    nom_du_beneficiaire_name_of_the_beneficiary AS beneficiary_name,
    resume_de_loperation_summary_of_the_operation AS operation_summary,
    CASE
      WHEN is_numeric("date_de_debut_de_loperation_date_of_the_beginning_of_the_opera") THEN to_timestamp_from_excel(TO_NUMBER("date_de_debut_de_loperation_date_of_the_beginning_of_the_opera", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_debut_de_loperation_date_of_the_beginning_of_the_opera",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin_de_loperation_end_date_of_the_operation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin_de_loperation_end_date_of_the_operation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("date_de_fin_de_loperation_end_date_of_the_operation",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles_total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    montant_ue_programme_amount_ue_programmed::DECIMAL / GREATEST((total_des_depenses_eligibles_total_eligible_expenditure::DECIMAL+montant_ue_programme_amount_ue_programmed::DECIMAL),1.0)*100.0 AS eu_cofinancing_rate,
    pays_country AS country,
    localisation_de_loperation_location_of_the_operation AS operation_location,
    NULL AS code_of_category_intervention,
    domaine_dintervention_area_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    CASE
      WHEN LOWER(localisation_de_loperation_location_of_the_operation) LIKE '%région%' THEN localisation_de_loperation_location_of_the_operation
      ELSE NULL
    END AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    CASE
      WHEN LOWER(localisation_de_loperation_location_of_the_operation) LIKE '%département%' THEN localisation_de_loperation_location_of_the_operation
      ELSE NULL
    END AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    CASE
      WHEN LOWER(localisation_de_loperation_location_of_the_operation) LIKE '%commune%' OR LOWER(localisation_de_loperation_location_of_the_operation) LIKE '%adresse%' THEN localisation_de_loperation_location_of_the_operation
      ELSE NULL
    END AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(code_postal_du_beneficaire_postal_code_of_the_beneficiary,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    montant_ue_programme_amount_ue_programmed::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M0OP015' AS cci,
    '2014FR16M0OP015_1' AS data_source
  FROM raw."2014FR16M0OP015_1"
),

"2014FR16M2OP005_1" AS (
  SELECT
    libelle_du_dossier AS operation_name,
    beneficiaire AS beneficiary_name,
    resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("debut_previsionnel_doperation") THEN to_timestamp_from_excel(TO_NUMBER("debut_previsionnel_doperation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("debut_previsionnel_doperation",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_previsionnelle_doperation") THEN to_timestamp_from_excel(TO_NUMBER("fin_previsionnelle_doperation", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fin_previsionnelle_doperation",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    cout_total_programme::DECIMAL AS operation_total_expenditure,
    montant_ue_programme::DECIMAL / GREATEST((cout_total_programme::DECIMAL+montant_ue_programme::DECIMAL),1.0)*100.0 AS eu_cofinancing_rate,
    NULL::TEXT AS country,
    REPLACE(liste_dep,'.0','') AS operation_location,
    NULL AS code_of_category_intervention,
    domaine_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    REPLACE(liste_dep,'.0','') AS operation_nuts3_code,
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
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16M2OP005' AS cci,
    '2014FR16M2OP005_1' AS data_source
  FROM raw."2014FR16M2OP005_1"
  WHERE libelle_du_dossier != 'Operation name'
),

"2014FR16RFOP004_1" AS (
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
    total_cost::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN eu_cofinancement_rate::DECIMAL > 1.0 THEN eu_cofinancement_rate::DECIMAL
      ELSE eu_cofinancement_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    precise_localisation AS operation_location,
    NULL AS code_of_category_intervention,
    intervention_field AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%région%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%département%' THEN precise_localisation
      ELSE NULL
    END AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    CASE
      WHEN LOWER(precise_localisation) LIKE '%commune%' OR LOWER(precise_localisation) LIKE '%adresse%' THEN precise_localisation
      ELSE NULL
    END AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(zipcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    eu_part::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16RFOP004' AS cci,
    '2014FR16RFOP004_1' AS data_source
  FROM raw."2014FR16RFOP004_1"
  WHERE country != 'Pays'
),

"2014FR16RFOP006_1" AS (
  SELECT
    libelle_du_dossier AS operation_name,
    beneficiaire AS beneficiary_name,
    resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("debut_de_la_periode_previsionnelle_dexecution") THEN to_timestamp_from_excel(TO_NUMBER("debut_de_la_periode_previsionnelle_dexecution", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("debut_de_la_periode_previsionnelle_dexecution",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_de_la_periode_previsionnelle_dexecution") THEN to_timestamp_from_excel(TO_NUMBER("fin_de_la_periode_previsionnelle_dexecution", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fin_de_la_periode_previsionnelle_dexecution",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_depenses_eligibles::DECIMAL AS operation_total_expenditure,
    montant_ue_programme::DECIMAL / GREATEST((total_depenses_eligibles::DECIMAL+montant_ue_programme::DECIMAL),1.0)*100.0 AS eu_cofinancing_rate,
    pays AS country,
    COALESCE(localisation_de_loperation, departement_de_loperation, cp) AS operation_location,
    NULL AS code_of_category_intervention,
    ci01__domaine_dintervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    CASE
      WHEN LOWER(localisation_de_loperation) LIKE '%région%' THEN localisation_de_loperation
      ELSE NULL
    END AS operation_nuts2_name,
    REPLACE(departement_de_loperation,'.0','') AS operation_nuts3_code,
    CASE
      WHEN LOWER(localisation_de_loperation) LIKE '%département%' THEN localisation_de_loperation
      ELSE NULL
    END AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    CASE
      WHEN LOWER(localisation_de_loperation) LIKE '%commune%' OR LOWER(localisation_de_loperation) LIKE '%adresse%' THEN localisation_de_loperation
      ELSE NULL
    END AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(cp,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    montant_ue_programme::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014FR16RFOP006' AS cci,
    '2014FR16RFOP006_1' AS data_source
  FROM raw."2014FR16RFOP006_1"
),

"2014FR16RFOP007_1" AS (
  SELECT
    operation__operation AS operation_name,
    beneficiaire__beneficiary AS beneficiary_name,
    resume_de_loperation__summary AS operation_summary,
    CASE
      WHEN is_numeric("debut_dexecution_start_date") THEN to_timestamp_from_excel(TO_NUMBER("debut_dexecution_start_date", '99999D9')::INTEGER)::DATE
      WHEN debut_dexecution_start_date ='Déprogrammation validée le 28/05/2019' THEN '2019-05-28'::DATE
      ELSE TO_DATE("debut_dexecution_start_date",'YYYY/MM/DD')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fin_dexecution__end_date") THEN to_timestamp_from_excel(TO_NUMBER("fin_dexecution__end_date", '99999D9')::INTEGER)::DATE
      WHEN debut_dexecution_start_date ='Déprogrammation validée le 28/05/2019' THEN '2019-05-28'::DATE
      ELSE TO_DATE("fin_dexecution__end_date",'YYYY/MM/DD')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles__total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN taux_cofinancement_ue__union_cofinancing_rate::DECIMAL > 1.0 THEN taux_cofinancement_ue__union_cofinancing_rate::DECIMAL
      ELSE taux_cofinancement_ue__union_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL::TEXT AS country,
    ville__city AS operation_location,
    NULL::TEXT AS code_of_category_intervention,
    categorie_dintervention__category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'FR' AS operation_nuts0,
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
    ville__city AS operation_city,
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
    '2014FR16RFOP007' AS cci,
    '2014FR16RFOP007_1' AS data_source
  FROM raw."2014FR16RFOP007_1"
),

"2014FR_1" AS (
  SELECT
    nom_de_loperation AS operation_name,
    nom_du_beneficiaire AS beneficiary_name,
    resume_de_loperation AS operation_summary,
    CASE
      WHEN is_numeric("date_de_debut_de_loperation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_debut_de_loperation", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("date_de_fin_de_loperation") THEN to_timestamp_from_excel(TO_NUMBER("date_de_fin_de_loperation", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    total_des_depenses_eligibles_attribue_a_loperation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN taux_de_cofinancement_de_loperation_par_lunion_europeenne::DECIMAL > 1.0 THEN taux_de_cofinancement_de_loperation_par_lunion_europeenne::DECIMAL
      ELSE taux_de_cofinancement_de_loperation_par_lunion_europeenne::DECIMAL *100.0
    END AS eu_cofinancing_rate,
    pays AS country,
    REPLACE(code_postal_de_loperation,'.0','') AS operation_location,
    REPLACE(categorie_dintervention_dont_releve_loperation,'.0','') AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    CASE
      WHEN is_numeric("date_de_mise_a_jour") THEN to_timestamp_from_excel(TO_NUMBER("date_de_mise_a_jour", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS date_of_last_update,
    'FR' AS operation_nuts0,
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
    REPLACE(code_postal_de_loperation,'.0','') AS operation_zip_code,
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
    '' AS cci,
    '2014FR_1' AS data_source
  FROM raw."2014FR_1"
  WHERE nom_du_beneficiaire != 'Beneficiary name'
),

vw AS (
  SELECT * FROM "2014FR05M0OP001_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP004_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP006_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP007_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP011_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP014_1"
  UNION ALL
  SELECT * FROM "2014FR16M0OP015_1"
  UNION ALL
  SELECT * FROM "2014FR16M2OP005_1"
  UNION ALL
  SELECT * FROM "2014FR16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014FR16RFOP006_1"
  UNION ALL
  SELECT * FROM "2014FR16RFOP007_1"
  UNION ALL
  SELECT * FROM "2014FR_1"
)

SELECT
  *
FROM vw;
