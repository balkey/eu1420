WITH
"2014AT16RFOP001" AS (
  SELECT
    bezeichnung_des_vorhabens_operation_name AS operation_name,
    name_des_begunstigten_name_of_beneficiary AS beneficiary_name,
    zusammenfassung_des_vorhabens_operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER(datum_des_beginns_des_vorhabens_operation_start_date, '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER(datum_des_endes_des_vorhabens_operation_end_date, '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    gesamtbetrag_der_forderfahigen_ausgaben_des_vorhabens_total_el::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL > 1.0 THEN unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL
      ELSE unionskofinanzierungssatz_pro_prioritatsachse_union_cofinancin::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land_country AS country,
    regionalcode_des_vorhabens_location_indicator AS operation_location,
    NULL AS code_of_category_intervention,
    bezeichnung_der_interventionskategorie_fur_das_vorhaben_name_o AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'AT' AS operation_nuts0,
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
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014AT16RFOP001' AS cci,
    '2014AT16RFOP001_1' AS data_source
  FROM raw."2014AT16RFOP001_1"
),

"2014BE16RFOP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_operation_in_euros::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_as_per_priority_axes_::DECIMAL > 1.0 THEN union_cofinancing_rate_as_per_priority_axes_::DECIMAL
      ELSE union_cofinancing_rate_as_per_priority_axes_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_1' AS data_source
  FROM raw."2014BE16RFOP001_1"
),

"2014BE16RFOP001_2" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    TO_DATE("operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_in_euros,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_2' AS data_source
  FROM raw."2014BE16RFOP001_2"
),

"2014BE16RFOP001_3" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_3' AS data_source
  FROM raw."2014BE16RFOP001_3"
),

"2014BE16RFOP001_4" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_en_euro,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_4' AS data_source
  FROM raw."2014BE16RFOP001_4"
),

"2014BE16RFOP001_5" AS (
SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_in_euros,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_5' AS data_source
  FROM raw."2014BE16RFOP001_5"
),

"2014BE16RFOP001_6" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_6' AS data_source
  FROM raw."2014BE16RFOP001_6"
),

"2014BE16RFOP001_7" AS (
SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    TO_DATE("operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
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
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_7' AS data_source
  FROM raw."2014BE16RFOP001_7"
),

"2014BE16RFOP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(REPLACE(total_eligible_expenditure,'?',''),' ',''),'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate,'%','')::DECIMAL > 1.00 THEN REPLACE(union_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    city operation_location,
    REPLACE(category_of_intervention,'.0','') AS code_of_category_intervention,
    category_of_intervention_2 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(REPLACE(efrosteun,'?',''),' ',''),'.',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(projectnumber, '.0', '') AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP002' AS cci,
    '2014BE16RFOP002_1' AS data_source
  FROM raw."2014BE16RFOP002_1"
),

"2014BE16RFOP003_1" AS (
  SELECT
    projet_operation_nameproject AS operation_name,
    beneficiaire_final_beneficiary_name AS beneficiary_name,
    resume_de_loperation_operation_summary AS operation_summary,
    TO_DATE("date_debut_de_loperation_operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("date_de_fin_de_loperation_operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) + (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL) AS operation_total_expenditure,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) / ((REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) + (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL))*100.0 AS eu_cofinancing_rate,
    -- TODO: THIS ^ NEEDS TO BE SUPERVISED:
    -- THERE IS A 'montant_des_aides_decidees__cout_total'
    -- column provided, but the 40 % cofinancing rate does
    -- does not apply to that column
    pays_country AS country,
    code_postal_operation_postcode AS operation_location,
    numero_de_ci_number_of_ci AS code_of_category_intervention,
    categorie_dintervention_ci_category_of_intervention_ci AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
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
    (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL) AS member_state_value,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ndeg_de_dossier AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP003' AS cci,
    '2014BE16RFOP003_1' AS data_source
  FROM raw."2014BE16RFOP003_1"
),

"2014BG05M2OP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    'BG' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BG05M2OP001' AS cci,
    '2014BG05M2OP001_1' AS data_source
  FROM raw."2014BG05M2OP001_1"
),

"2014BG16M1OP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    '' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BG16M1OP001' AS cci,
    '2014BG16M1OP001_1' AS data_source
  FROM raw."2014BG16M1OP001_1"
),

"2014BG16M1OP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    '' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BG16M1OP002' AS cci,
    '2014BG16M1OP002_1' AS data_source
  FROM raw."2014BG16M1OP002_1"
),

"2014BG16RFOP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    '' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BG16RFOP001' AS cci,
    '2014BG16RFOP001_1' AS data_source
  FROM raw."2014BG16RFOP001_1"
),

"2014BG16RFOP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    '' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BG16RFOP002' AS cci,
    '2014BG16RFOP002_1' AS data_source
  FROM raw."2014BG16RFOP002_1"
),

"2015BG16RFSM001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    summary_of_the_operation AS operation_summary,
    TO_DATE(REPLACE(operation_start_date,' г.',''),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(date_of_completion_of_the_operation,' г.',''),'DD.MM.YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    -- TODO: THIS NEEDS TO BE CONFIRMED IF EUR OR BGN
    total_eligible_costs_granted_for_the_operation::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_ec_cofinancing::DECIMAL > 1.0 THEN _of_ec_cofinancing::DECIMAL
      ELSE _of_ec_cofinancing::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    "location" AS operation_location,
    NULL AS code_of_category_intervention,
    name_of_categories_of_interventions_for_the_operation AS name_of_category_intervention,
    TO_DATE(REPLACE(date_of_last_update_of_the_list_of_operations,' г.',''),'DD.MM.YYYY')::DATE AS date_of_last_update,
    '' AS operation_nuts0,
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
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2015BG16RFSM001' AS cci,
    '2015BG16RFSM001_1' AS data_source
  FROM raw."2015BG16RFSM001_1"
 ),

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
    NULL AS cci,
    '2014CZ_1' AS data_source
  FROM raw."2014CZ_1"
  WHERE mena != 'Currency'
),

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

"2014DK16RFOP001_1" AS (
  SELECT
    projektitel__operation_name AS operation_name,
    kontraktansvarlig_partner__beneficiary_name AS beneficiary_name,
    projektbeskrivelse AS operation_summary,
    CASE
      WHEN is_numeric("startdato__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("startdato__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("startdato__operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("slutdato__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("slutdato__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("slutdato__operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'DKK' AS currency,
    REPLACE(budget__budget, '.','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL > 1.0 THEN REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL 
      ELSE REPLACE("eumedfinansieringssats__union_cofinancing_rate", '%', '')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    land__country AS country,
    region__region operation_location,
    NULL AS code_of_category_intervention,
    interventionskategori1__category_of_intervention1 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'DK' AS operation_nuts0,
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
    postnr__operation_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(eumedfinansiering__union_cofinancing,'.','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    prioritetsakse__priority_axis AS priority_axis,
    NULL AS form_of_finance,
    interventionskategori2__category_of_intervention2 AS territorial_dimension,
    interventionskategori3__category_of_intervention3 AS territorial_delivery_mechanism,
    interventionskategori4__category_of_intervention4 AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014DK16RFOP001' AS cci,
    '2014DK16RFOP001_1' AS data_source
  FROM raw."2014DK16RFOP001_1"
),

"2014ES16RFOP002_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP002_1' AS data_source
  FROM raw."2014ES16RFOP002_1"
),

"2014ES16RFOP003_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP003_1' AS data_source
  FROM raw."2014ES16RFOP003_1"
),

"2014ES16RFOP004_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP004_1' AS data_source
  FROM raw."2014ES16RFOP004_1"
),

"2014ES16RFOP005_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP005_1' AS data_source
  FROM raw."2014ES16RFOP005_1"
),

"2014ES16RFOP006_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP006_1' AS data_source
  FROM raw."2014ES16RFOP006_1"
),

"2014ES16RFOP007_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP007_1' AS data_source
  FROM raw."2014ES16RFOP007_1"
),

"2014ES16RFOP008_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP008_1' AS data_source
  FROM raw."2014ES16RFOP008_1"
),

"2014ES16RFOP009_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP009_1' AS data_source
  FROM raw."2014ES16RFOP009_1"
),

"2014ES16RFOP010_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP010_1' AS data_source
  FROM raw."2014ES16RFOP010_1"
),

"2014ES16RFOP011_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP010_1' AS data_source
  FROM raw."2014ES16RFOP011_1"
),

"2014ES16RFOP012_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP012_1' AS data_source
  FROM raw."2014ES16RFOP012_1"
),

"2014ES16RFOP013_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP013_1' AS data_source
  FROM raw."2014ES16RFOP013_1"
),

"2014ES16RFOP014_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP014_1' AS data_source
  FROM raw."2014ES16RFOP014_1"
),

"2014ES16RFOP015_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP015_1' AS data_source
  FROM raw."2014ES16RFOP015_1"
),

"2014ES16RFOP016_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP016_1' AS data_source
  FROM raw."2014ES16RFOP016_1"
),

"2014ES16RFOP017_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP017_1' AS data_source
  FROM raw."2014ES16RFOP017_1"
),

"2014ES16RFOP018_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP018_1' AS data_source
  FROM raw."2014ES16RFOP018_1"
),

"2014ES16RFOP019_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP019_1' AS data_source
  FROM raw."2014ES16RFOP019_1"
),

"2014ES16RFOP020_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP020_1' AS data_source
  FROM raw."2014ES16RFOP020_1"
),

"2014ES16RFOP021_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    campo_de_intervencion_23 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    localizacion_30 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(codigo_postal,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    tipo_de_financiacion_24 AS form_of_finance,
    tipo_de_territorio_25 AS territorial_dimension,
    sistema_de_entrega_territorial_26 AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    cci AS cci,
    '2014ES16RFOP020_1' AS data_source
  FROM raw."2014ES16RFOP021_1"
),

"2014ES16RFSM001_1" AS (
  SELECT
    operacion_5 AS operation_name,
    beneficiario1 AS beneficiary_name,
    resumen_6 AS operation_summary,
    CASE
      WHEN is_numeric("fecha_inicio_8") THEN to_timestamp_from_excel(TO_NUMBER("fecha_inicio_8", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_inicio_8",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN LENGTH(fecha_fin_10_o_9) != 7 THEN NULL
      WHEN is_numeric("fecha_fin_10_o_9") THEN to_timestamp_from_excel(TO_NUMBER("fecha_fin_10_o_9", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("fecha_fin_10_o_9",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    coste_gasto_total_subvencionable_41::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN cofinanciacion_ue::DECIMAL > 1.0 THEN cofinanciacion_ue::DECIMAL
      ELSE cofinanciacion_ue::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais AS country,
    municipio AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'ES' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipio AS operation_lau2_name,
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
    cci AS cci,
    '2014ES16RFOP020_1' AS data_source
  FROM raw."2014ES16RFSM001_1"
),

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

"2014GR16M2OP001_1" AS (
  SELECT
    onomasia_prakses_operation_name AS operation_name,
    onomasia_dikaioukhou__beneficiary_name AS beneficiary_name,
    sunopse_praksesoperation_summary AS operation_summary,
    CASE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) = 'ιαν' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-01-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='φεβ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-02-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='μαρ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-03-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='απρ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-04-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='μαϊ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-05-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='ιουν' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-06-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='ιουλ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-07-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='αυγ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-08-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='σεπ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-09-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='οκτ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-10-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='νοε' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-11-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',2)) ='δεκ' THEN ('20'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',3))||'-12-'||LOWER(SPLIT_PART(emnia_enarkses_tes_prakses__operation_start_date,'-',1)))::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) = 'ιαν' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-01-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='φεβ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-02-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='μαρ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-03-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='απρ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-04-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='μαϊ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-05-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='ιουν' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-06-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='ιουλ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-07-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='αυγ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-08-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='σεπ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-09-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='οκτ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-10-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='νοε' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-11-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',2)) ='δεκ' THEN ('20'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',3))||'-12-'||LOWER(SPLIT_PART(katalektike_emeromenia_prakses__operation_end_date,'-',1)))::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(sunolike_epileksime_dapane_pou_diatetheke_sten_prakse_proupolo,'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(pososto_sugkhrematodoteses_tes_enoses_ana_aksona_proteraioteta,',','.')::DECIMAL > 1.0 THEN REPLACE(pososto_sugkhrematodoteses_tes_enoses_ana_aksona_proteraioteta,',','.')::DECIMAL
      ELSE REPLACE(pososto_sugkhrematodoteses_tes_enoses_ana_aksona_proteraioteta,',','.')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    khoracountry AS country,
    takhudromikos_kodikas_e_alle_katallele_endeikse_topothesiaspos AS operation_location,
    NULL::TEXT AS code_of_category_intervention,
    onomasia_kategorias_parembases_tes_prakses_name_of_category_of AS name_of_category_intervention,
    CASE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) = 'ιαν' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-01-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='φεβ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-02-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='μαρ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-03-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='απρ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-04-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='μαϊ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-05-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='ιουν' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-06-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='ιουλ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-07-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='αυγ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-08-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='σεπ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-09-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='οκτ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-10-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='νοε' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-11-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      WHEN LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',2)) ='δεκ' THEN ('20'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',3))||'-12-'||LOWER(SPLIT_PART(teleutaia_enemerose_katalogou_last_update_of_the_list,'-',1)))::DATE
      ELSE NULL::DATE
    END AS date_of_last_update,
    'GR' AS operation_nuts0,
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
    takhudromikos_kodikas_e_alle_katallele_endeikse_topothesiaspos AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    aksonas_proteraiotetaspriority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014GR16M2OP001' AS cci,
    '2014GR16M2OP001_1' AS data_source
  FROM raw."2014GR16M2OP001_1"
),

"2014GR16M2OP007_1" AS (
  SELECT
    onomasia_prakses AS operation_name,
    onomasia_dikaioukhou AS beneficiary_name,
    NULL::TEXT AS operation_summary,
    CASE
      WHEN is_numeric("emnia_enarkses_prakses") THEN to_timestamp_from_excel(TO_NUMBER("emnia_enarkses_prakses", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("emnia_enarkses_prakses",'DD/MM/YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("emnia_lekses_prakses") THEN to_timestamp_from_excel(TO_NUMBER("emnia_lekses_prakses", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("emnia_lekses_prakses",'DD/MM/YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    sugkhrematodotoumene_dd_ergou_pros_es::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN pososto_enosiakes_sterikses__aksona::DECIMAL > 1.0 THEN pososto_enosiakes_sterikses__aksona::DECIMAL
      ELSE pososto_enosiakes_sterikses__aksona::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL::TEXT AS country,
    NULL::TEXT AS operation_location,
    REPLACE(kod_pediou_parembases,'.0','') AS code_of_category_intervention,
    missing_column_name_1 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'GR' AS operation_nuts0,
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
    REPLACE(kod_aksona_proteraiotetas,'.0','') AS priority_axis,
    NULL AS form_of_finance,
    kategoria_periphereias AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014GR16M2OP007_1' AS cci,
    '2014GR16M2OP007_1' AS data_source
  FROM raw."2014GR16M2OP007_1"
  WHERE pososto_enosiakes_sterikses__aksona IS NOT NULL
),

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
  SELECT * FROM "2014AT16RFOP001"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_2"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_3"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_4"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_5"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_6"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_7"
  UNION ALL
  SELECT * FROM "2014BE16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014BE16RFOP003_1"
  UNION ALL
  SELECT * FROM "2014BG05M2OP001_1"
  UNION ALL
  SELECT * FROM "2014BG16M1OP001_1"
  UNION ALL
  SELECT * FROM "2014BG16M1OP002_1"
  UNION ALL
  SELECT * FROM "2014BG16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014BG16RFOP002_1"
  UNION ALL
  SELECT * FROM "2015BG16RFSM001_1"
  UNION ALL
  SELECT * FROM "2014CZ_1"
  UNION ALL
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
  UNION ALL
  SELECT * FROM "2014DK16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP003_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP005_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP006_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP007_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP008_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP009_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP010_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP011_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP012_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP013_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP014_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP015_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP016_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP017_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP018_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP019_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP020_1"
  UNION ALL
  SELECT * FROM "2014ES16RFOP021_1"
  UNION ALL
  SELECT * FROM "2014ES16RFSM001_1"
  UNION ALL
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
  UNION ALL
  SELECT * FROM "2014GR16M2OP001_1"
  UNION ALL
  SELECT * FROM "2014GR16M2OP007_1"
  UNION ALL
  SELECT * FROM "2014HR16M1OP001_1"
  UNION ALL
  SELECT * FROM "2014HU_1"
)

SELECT
  *
FROM vw;