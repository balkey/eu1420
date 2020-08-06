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

"2014IE16RFOP001_1" AS (
  SELECT
    project_name AS operation_name,
    beneficiary_name AS beneficiary_name,
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
    total_public_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN erdf_cofinancing_rate::DECIMAL > 1.0 THEN erdf_cofinancing_rate::DECIMAL
      ELSE erdf_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    postcodecounty AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'IE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    postcodecounty AS operation_nuts3_name,
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
    '2014IE16RFOP001' AS cci,
    '2014IE16RFOP001_1' AS data_source
  FROM raw."2014IE16RFOP001_1"
),

"2014IE16RFOP002_1" AS (
  SELECT
    project_name AS operation_name,
    beneficiary_name AS beneficiary_name,
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
    total_public_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN erdf_rate::DECIMAL > 1.0 THEN erdf_rate::DECIMAL
      ELSE erdf_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    project_eircode_county AS operation_location,
    NULL AS code_of_category_intervention,
    category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'IE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nuts_region AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    project_eircode_county AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    erdf_amount::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_unique_id_2_new AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014IE16RFOP002' AS cci,
    '2014IE16RFOP002_1' AS data_source
  FROM raw."2014IE16RFOP002_1"
),

"2014ITERDFTC_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITERDFTC' AS cci,
    '2014ITERDFTC_1' AS data_source
  FROM raw."2014ITERDFTC_1"
),

"2014ITERDF_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITERDF' AS cci,
    '2014ITERDF_1' AS data_source
  FROM raw."2014ITERDF_1"
),

"2014ITESF_1" AS (
  SELECT
    oc_titolo_progetto AS operation_name,
    oc_denom_beneficiario AS beneficiary_name,
    oc_sintesi_progetto AS operation_summary,
    TO_DATE("oc_data_inizio_progetto",'YYYYMMDD') AS operation_start_date,
    TO_DATE(COALESCE("oc_data_fine_progetto_prevista","oc_data_fine_progetto_effettiva"),'YYYYMMDD') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(finanz_totale_pubblico,',','.')::DECIMAL AS operation_total_expenditure,
    (REPLACE(finanz_ue,',','.')::DECIMAL / REPLACE(finanz_totale_pubblico,',','.')::DECIMAL)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    den_comune AS operation_location,
    cod_priorita_invest AS code_of_category_intervention,
    descr_priorita_invest AS name_of_category_intervention,
    TO_DATE("data_aggiornamento",'YYYYMMDD') AS date_of_last_update,
    'IT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    cod_regione AS operation_nuts2_code,
    den_regione AS operation_nuts2_name,
    cod_provincia AS operation_nuts3_code,
    den_provincia AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    cod_comune AS operation_lau2_code,
    den_comune AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(finanz_ue,',','.')::DECIMAL AS eu_subsidy_value,
    oc_codfisc_beneficiario AS beneficiary_id,
    cup AS operation_id,
    oc_tema_sintetico AS priority_axis,
    descr_strumento AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    -- TODO: CHECK THE MAPPINGS OF THESE VALUES!
    '2014ITESF' AS cci,
    '2014ITESF_1' AS data_source
  FROM raw."2014ITESF_1"
),

"2014LU16RFOP001_1" AS (
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
    total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    erdf_cofinancing_40::DECIMAL / total_eligible_expenditure::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    municipality AS operation_location,
    category_of_intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'LU' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    municipality AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ndeg_of_project AS operation_id,
    axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014LU16RFOP001' AS cci,
    '2014LU16RFOP001_1' AS data_source
  FROM raw."2014LU16RFOP001_1"
  WHERE beneficiary_name NOT IN ('Beneficiary name','Nom du bénéficiaire')
),

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

"2014NL16RFOP002_1" AS (
  SELECT
    projecttitel_in_het_engels AS operation_name,
    begunstigde AS beneficiary_name,
    samenvatting AS operation_summary,
    CASE
      WHEN is_numeric("begindatum") THEN to_timestamp_from_excel(TO_NUMBER("begindatum", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("begindatum",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("einddatum") THEN to_timestamp_from_excel(TO_NUMBER("einddatum", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("einddatum",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    totale_kosten::DECIMAL AS operation_total_expenditure,
    (eusubsidie::DECIMAL / GREATEST(totale_kosten::DECIMAL,1.0))*100.0 AS eu_cofinancing_rate,
    land AS country,
    plaats AS operation_location,
    categorie_steunverlening_code AS code_of_category_intervention,
    categorie_steunverlening_omschrijving AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'NL' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    plaats AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    eusubsidie::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    thematische_doelstelling_omschrijving AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014NL16RFOP002' AS cci,
    '2014NL16RFOP002_1' AS data_source
  FROM raw."2014NL16RFOP002_1"
),

"2014NL16RFOP003_1" AS (
  SELECT
    projectnaam__name_of_project AS operation_name,
    begunstigde__beneficiary AS beneficiary_name,
    projectbeschrijving__project_description AS operation_summary,
    CASE
      WHEN is_numeric("startdatum__start_date") THEN to_timestamp_from_excel(TO_NUMBER("startdatum__start_date", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("einddatum__end_date") THEN to_timestamp_from_excel(TO_NUMBER("einddatum__end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("einddatum__end_date",'DD-MM-YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    totaal_subsidiabele_kosten__total_eligible_costs::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN efrobijdrage___cofinancing_erdf_::DECIMAL > 1 THEN efrobijdrage___cofinancing_erdf_::DECIMAL
      ELSE efrobijdrage___cofinancing_erdf_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    landen__country_countries AS country,
    projectlocatie__project_location AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    CASE
      WHEN is_numeric("datum_laatste_bijwerking") THEN to_timestamp_from_excel(TO_NUMBER("datum_laatste_bijwerking", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_laatste_bijwerking",'DD-MM-YYYY')::DATE
    END AS date_of_last_update,
    'NL' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    provincie__province AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    projectlocatie__project_location AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    efro__erdf::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    projectnummer_project_number AS operation_id,
    prioriteit__priority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014NL16RFOP003' AS cci,
    '2014NL16RFOP003_1' AS data_source
  FROM raw."2014NL16RFOP003_1"
),

"2014NL16RFOP004_1" AS (
  SELECT
    projecttitel_in_het_engels AS operation_name,
    begunstigde AS beneficiary_name,
    samenvatting AS operation_summary,
    CASE
      WHEN is_numeric(LEFT(begindatum,4)) THEN begindatum::DATE
      ELSE TO_DATE("begindatum",'D-MM-YY')
    END AS operation_start_date,
    TO_DATE("einddatum",'D-MM-YY') AS operation_end_date,
    'EUR' AS currency,
    REPLACE(totale_kosten,'.','')::DECIMAL AS operation_total_expenditure,
    REPLACE(medefinancieringspercentage,',','.')::DECIMAL*100.0 AS eu_cofinancing_rate,
    land AS country,
    plaats AS operation_location,
    categorie_steunverlening_code AS code_of_category_intervention,
    categorie_steunverlening_omschrijving AS name_of_category_intervention,
    datum_laatste_bijwerking::DATE AS date_of_last_update,
    'NL' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    plaats AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    REPLACE(eusubsidie,'.','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    thematische_doelstelling_omschrijving AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014NL16RFOP004' AS cci,
    '2014NL16RFOP004_1' AS data_source
  FROM raw."2014NL16RFOP004_1"
  WHERE begunstigde != 'Beneficiary '
),

"2014PL16M2OP001_1" AS (
  SELECT
    nazwa_operacji_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_operacji__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_operacji__project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_operacji__project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_operacji__project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_operacji__project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_operacji__project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_operacji__project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    calkowite_wydatki_pln__total_project_cost_in_pln::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN stopa_unijnego_dofinansowania_eu_cofinancing_rate_::DECIMAL > 1.0 THEN stopa_unijnego_dofinansowania_eu_cofinancing_rate_::DECIMAL
      ELSE stopa_unijnego_dofinansowania_eu_cofinancing_rate_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    panstwocountry AS country,
    powiat__miejsce_realizacji__poviat__project_location AS operation_location,
    NULL AS code_of_category_intervention,
    nazwa_kategorii_interwencji__name_of_intervention_category AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    '' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    gmina__miejsce_realizacji__commune_municipality__project_locat AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    dofinansowanie_ue_pln__eu_cofinancing_amount_in_pln::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP001' AS cci,
    '2014PL16M2OP001_1' AS data_source
  FROM raw."2014PL16M2OP001_1"
),

"2014PL16M2OP005_1" AS (
  SELECT
    tytul_projektu AS operation_name,
    nazwa_wnioskodawcy AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_pln::DECIMAL AS operation_total_expenditure,
    (wartosc_unijnego_dofinansowania_pln::DECIMAL / wartosc_projektu_pln::DECIMAL)*100.0AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    dzialanie__kod AS code_of_category_intervention,
    dzialanie__nazwa AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_pln::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    lp AS operation_id,
    os__nazwa AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP005' AS cci,
    '2014PL16M2OP005_1' AS data_source
  FROM raw."2014PL16M2OP005_1"
),

"2014PL16M2OP006_1" AS (
  SELECT
    tytul_projektu AS operation_name,
    nazwa_wnioskodawcy AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd",'YYYY-MM-DD')
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd" ~ '[0-9]{4}.[0-1]{1}[0-9]{1}.[0-3]{1}[0-9]{1}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd",'YYYY.MM.DD')
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd" ~ '[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[0-9]{4}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd",'DD-MM-YYYY') 
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd",'YYYY-MM-DD')
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd" ~ '[0-9]{4}.[0-1]{1}[0-9]{1}.[0-3]{1}[0-9]{1}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd",'YYYY.MM.DD')
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd" ~ '[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[0-9]{4}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd",'DD-MM-YYYY') 
      ELSE NULL::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')) THEN REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS operation_total_expenditure,
    CASE 
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania,'zł',''),',','.'),' ',''),' ','')) AND is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')) THEN (REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania,'zł',''),',','.'),' ',''),' ','')::DECIMAL / REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')::DECIMAL)*100.0
      ELSE NULL::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL::TEXT AS code_of_category_intervention,
    NULL::TEXT AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania,'zł',''),',','.'),' ',''),' ','')) THEN REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania,'zł',''),',','.'),' ',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    lp AS operation_id,
    priorytetdzialaniepoddzialanie AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP006' AS cci,
    '2014PL16M2OP006_1' AS data_source
  FROM raw."2014PL16M2OP006_1"
),

"2014PL16M2OP007_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP007' AS cci,
    '2014PL16M2OP007_1' AS data_source
  FROM raw."2014PL16M2OP007_1"
),

"2014PL16M2OP008_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP008' AS cci,
    '2014PL16M2OP008_1' AS data_source
  FROM raw."2014PL16M2OP008_1"
),

"2014PL16M2OP009_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP009' AS cci,
    '2014PL16M2OP009_1' AS data_source
  FROM raw."2014PL16M2OP009_1"
),

"2014PL16M2OP010_1" AS (
  SELECT
    tytul_projektu__project_name AS operation_name,
    nazwa_wnioskodawcy__beneficiary_name AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_", '99999D9')::INTEGER)::DATE
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_",'YYYY-MM-DD')
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-9]{4}.[0-1]{1}[0-9]{1}.[0-3]{1}[0-9]{1}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_",'YYYY.MM.DD')
      WHEN "data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[0-9]{4}' THEN TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd__project_",'DD-MM-YYYY') 
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_", '99999D9')::INTEGER)::DATE
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_",'YYYY-MM-DD')
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-9]{4}.[0-1]{1}[0-9]{1}.[0-3]{1}[0-9]{1}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_",'YYYY.MM.DD')
      WHEN "data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_" ~ '[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[0-9]{4}' THEN TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd__project_",'DD-MM-YYYY') 
      ELSE NULL::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    CASE
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu__total_project_value,'zł',''),',','.'),' ',''),' ','')) THEN REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu__total_project_value,'zł',''),',','.'),' ',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS operation_total_expenditure,
    CASE 
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania__amount_of_eu_cofinancing,'zł',''),',','.'),' ',''),' ','')) AND is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu__total_project_value,'zł',''),',','.'),' ',''),' ','')) THEN (REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania__amount_of_eu_cofinancing,'zł',''),',','.'),' ',''),' ','')::DECIMAL / REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu__total_project_value,'zł',''),',','.'),' ',''),' ','')::DECIMAL)*100.0
      ELSE NULL::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL::TEXT AS code_of_category_intervention,
    NULL::TEXT AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
      WHEN is_numeric(REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania__amount_of_eu_cofinancing,'zł',''),',','.'),' ',''),' ','')) THEN REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania__amount_of_eu_cofinancing,'zł',''),',','.'),' ',''),' ','')::DECIMAL
      ELSE NULL::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    lp__no AS operation_id,
    priorytetdzialanie__priority_axismeasure AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP010' AS cci,
    '2014PL16M2OP010_1' AS data_source
  FROM raw."2014PL16M2OP010_1"
),

"2014PL16M2OP011_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP011' AS cci,
    '2014PL16M2OP011_1' AS data_source
  FROM raw."2014PL16M2OP011_1"
),

"2014PL16M2OP012_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP012' AS cci,
    '2014PL16M2OP012_1' AS data_source
  FROM raw."2014PL16M2OP012_1"
),

"2014PL16M2OP013_1" AS (
  SELECT
    tytul_projektu AS operation_name,
    beneficjent_wiodacy__nazwa AS beneficiary_name,
    krotki_opis_projektu AS operation_summary,
    CASE
      WHEN is_numeric("okres_realizacji_projektu_od") THEN to_timestamp_from_excel(TO_NUMBER("okres_realizacji_projektu_od", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("okres_realizacji_projektu_od",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("okres_realizacji_projektu_do") THEN to_timestamp_from_excel(TO_NUMBER("okres_realizacji_projektu_do", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("okres_realizacji_projektu_do",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wydatki_kwalifikowalne::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _dofinansowania::DECIMAL > 1.0 THEN _dofinansowania::DECIMAL
      ELSE _dofinansowania::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejsce_realizacji__gmina AS operation_location,
    NULL AS code_of_category_intervention,
    zakres_interwencji_dominujacy AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    miejsce_realizacji__powiat AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    miejsce_realizacji__gmina AS operation_lau2_name,
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
    '2014PL16M2OP013' AS cci,
    '2014PL16M2OP013_1' AS data_source
  FROM raw."2014PL16M2OP013_1"
),

"2014PL16M2OP014_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP014' AS cci,
    '2014PL16M2OP014_1' AS data_source
  FROM raw."2014PL16M2OP014_1"
),

"2014PL16M2OP015_1" AS (
  SELECT
    tytul_projektu_project_title AS operation_name,
    beneficjent_nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("okres_realizacji_projektu_od_project_implementation_period_fro") THEN to_timestamp_from_excel(TO_NUMBER("okres_realizacji_projektu_od_project_implementation_period_fro", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("okres_realizacji_projektu_od_project_implementation_period_fro",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("okres_realizacji_projektu_do_project_implementation_period_unt") THEN to_timestamp_from_excel(TO_NUMBER("okres_realizacji_projektu_do_project_implementation_period_unt", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("okres_realizacji_projektu_do_project_implementation_period_unt",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_ogolem_total_cost::DECIMAL AS operation_total_expenditure,
    wklad_ue_eu_support::DECIMAL / GREATEST(wartosc_ogolem_total_cost::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    miejscowosc_town AS operation_location,
    dzialanie__kodmeasure__code AS code_of_category_intervention,
    dzialanie__nazwa_measure__name AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    powiat_poviat AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    gmina_commune AS operation_lau2_code,
    NULL AS operation_lau2_name,
    miejscowosc_town AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    dofinansowanie_public_support::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_wniosku_o_dofinansowanie_application_form_reference_numb AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP015' AS cci,
    '2014PL16M2OP015_1' AS data_source
  FROM raw."2014PL16M2OP015_1"
),

"2014PL16M2OP016_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16M2OP016' AS cci,
    '2014PL16M2OP016_1' AS data_source
  FROM raw."2014PL16M2OP016_1"
),

"2014PL16RFOP001_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16RFOP001' AS cci,
    '2014PL16RFOP001_1' AS data_source
  FROM raw."2014PL16RFOP001_1"
),

"2014PL16RFOP002_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    cel_uzupelniajacy_dla_projektow_efs_esf_secondary_theme AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16RFOP002' AS cci,
    '2014PL16RFOP002_1' AS data_source
  FROM raw."2014PL16RFOP002_1"
),

"2014PL16RFOP003_1" AS (
  SELECT
    tytul_projektu_project_name AS operation_name,
    nazwa_beneficjenta_beneficiary_name AS beneficiary_name,
    skrocony_opis_do_2000_znakow__project_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_project_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_project_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_project_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_project_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_project_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_project_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'PLN' AS currency,
    wartosc_projektu_wzl_dla_projektow_ewt_w_euro_totalproject_val::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL > 1.0 THEN poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
      ELSE poziom_unijnego_dofinansowania_w_procentach_w_union_cofinancin::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    miejscerealizacjiprojektuprojectlocation AS operation_location,
    NULL AS code_of_category_intervention,
    obszar_wsparcia_projektu_area_of_project_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PL' AS operation_nuts0,
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
    wartosc_unijnego_dofinansowania_wzl_dla_projektow_ewt_w_euro_a::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    numer_umowydecyzji_contract_number AS operation_id,
    priorytet_priority_axis AS priority_axis,
    forma_finansowania_form_of_finance AS form_of_finance,
    typ_obszaru_na_ktorym_realizowany_jest_projekt_territory_type AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PL16RFOP003' AS cci,
    '2014PL16RFOP003_1' AS data_source
  FROM raw."2014PL16RFOP003_1"
),

-- "2014PT16M2OP001_3" AS (
--  SELECT
--    *
--  FROM 2014PT16M2OP001_3
--TODO: WHY IS THIS MISSING?
--),

"2014PT16M2OP001_3" AS (
  SELECT
    designacao_da_operacao AS operation_name,
    designacao_beneficiario_principal AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio_operacao",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim_operacao",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    investimento_total::DECIMAL AS operation_total_expenditure,
    fundo::DECIMAL / investimento_total::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    concelho AS operation_location,
    codigo_concurso AS code_of_category_intervention,
    designacao_concurso AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nutiii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo::DECIMAL AS eu_subsidy_value,
    nif_beneficiario AS beneficiary_id,
    codigo_da_operacao AS operation_id,
    NULL AS priority_axis,
    natureza_do_investimento AS form_of_finance,
    dominio_tematico__area_tematica AS territorial_dimension,
    abordagem_territorial AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP001' AS cci,
    '2014PT16M2OP001_3' AS data_source
  FROM raw."2014PT16M2OP001_3"
),

"2014PT16M2OP001_4" AS (
  SELECT
    designacao_da_operacao AS operation_name,
    designacao_beneficiario_principal AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio_operacao",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim_operacao",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    investimento_total::DECIMAL AS operation_total_expenditure,
    fundo::DECIMAL / investimento_total::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    concelho AS operation_location,
    codigo_concurso AS code_of_category_intervention,
    designacao_concurso AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nutiii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo::DECIMAL AS eu_subsidy_value,
    nif_beneficiario AS beneficiary_id,
    codigo_da_operacao AS operation_id,
    NULL AS priority_axis,
    natureza_do_investimento AS form_of_finance,
    dominio_tematico__area_tematica AS territorial_dimension,
    abordagem_territorial AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP001' AS cci,
    '2014PT16M2OP001_4' AS data_source
  FROM raw."2014PT16M2OP001_4"
),

"2014PT16M2OP001_5" AS (
  SELECT
    designacao_da_operacao AS operation_name,
    designacao_beneficiario_principal AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio_operacao",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim_operacao",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    investimento_total::DECIMAL AS operation_total_expenditure,
    fundo::DECIMAL / investimento_total::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    concelho AS operation_location,
    codigo_concurso AS code_of_category_intervention,
    designacao_concurso AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nutiii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo::DECIMAL AS eu_subsidy_value,
    nif_beneficiario AS beneficiary_id,
    codigo_da_operacao AS operation_id,
    NULL AS priority_axis,
    natureza_do_investimento AS form_of_finance,
    dominio_tematico__area_tematica AS territorial_dimension,
    abordagem_territorial AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP001' AS cci,
    '2014PT16M2OP001_5' AS data_source
  FROM raw."2014PT16M2OP001_5"
),

"2014PT16M2OP001_6" AS (
  SELECT
    designacao_da_operacao AS operation_name,
    designacao_beneficiario_principal AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio_operacao",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_operacao") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_operacao", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim_operacao",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    investimento_total::DECIMAL AS operation_total_expenditure,
    fundo::DECIMAL / investimento_total::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    concelho AS operation_location,
    codigo_concurso AS code_of_category_intervention,
    designacao_concurso AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nutiii AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo::DECIMAL AS eu_subsidy_value,
    nif_beneficiario AS beneficiary_id,
    codigo_da_operacao AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    dominio_tematico__area_tematica AS territorial_dimension,
    abordagem_territorial AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP001' AS cci,
    '2014PT16M2OP001_6' AS data_source
  FROM raw."2014PT16M2OP001_6"
),

"2014PT16M2OP001_7" AS (
  SELECT
    nome_da_operacaooperation_name AS operation_name,
    nome_do_beneficiariobeneficiary_name AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_da_operacao_operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_da_operacao_operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio_da_operacao_operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_da_operacao_operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_da_operacao_operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim_da_operacao_operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    investimento_total_aprovadototal_costs::DECIMAL AS operation_total_expenditure,
    fundo_aprovadoapproved_fund::DECIMAL / investimento_total_aprovadototal_costs::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    concelhocounty AS operation_location,
    NULL AS code_of_category_intervention,
    tipologia_da_operacaooperation_typology AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nuts_iiinuts_ii AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelhocounty AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo_aprovadoapproved_fund::DECIMAL AS eu_subsidy_value,
    niftin AS beneficiary_id,
    codigo_da_operacao_operation_code AS operation_id,
    prioridadepriority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    abordagem_territorial AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP001' AS cci,
    '2014PT16M2OP001_7' AS data_source
  FROM raw."2014PT16M2OP001_7"
),

"2014PT16M2OP003_1" AS (
  SELECT
    nome_da_operacao__operation_name AS operation_name,
    nome_do_beneficiario__beneficiary_name AS beneficiary_name,
    resumo__summary AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio__start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio__start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio__start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim__finish_date") THEN to_timestamp_from_excel(TO_NUMBER("data_fim__finish_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim__finish_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    despesas_elegiveis_totais_atribuidas_a_operacao__total_eligibl::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _cofinanciamento___eu_funding::DECIMAL > 1.0 THEN _cofinanciamento___eu_funding::DECIMAL
      ELSE _cofinanciamento___eu_funding::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais__country AS country,
    freguesia__parrish AS operation_location,
    dominio_intervencao__category_of_intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nuts_ii__nuts_2 AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nuts_iii__nuts_3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho__municipality AS operation_lau1_name,
    NULL AS operation_lau2_code,
    freguesia__parrish AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo_total_aprovado__total_aproved_fund_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    codigo_da_operacao__operation_code AS operation_id,
    eixo_prioritario_do_po__op_priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    prioridade_de_investimento__investment_priority AS economic_dimension,
    '2014PT16M2OP003' AS cci,
    '2014PT16M2OP003_1' AS data_source
  FROM raw."2014PT16M2OP003_1"
),

"2014PT16M2OP005_1" AS (
  SELECT
    nome_da_operacao__operation_name AS operation_name,
    nome_do_beneficiario__beneficiary_name AS beneficiary_name,
    resumo__summary AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio__start_date") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio__start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_inicio__start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim__finish_date") THEN to_timestamp_from_excel(TO_NUMBER("data_fim__finish_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_fim__finish_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    despesas_elegiveis_totais_atribuidas_a_operacao__total_eligibl::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _cofinanciamento___eu_funding::DECIMAL > 1.0 THEN _cofinanciamento___eu_funding::DECIMAL
      ELSE _cofinanciamento___eu_funding::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais__country AS country,
    freguesia__parrish AS operation_location,
    codigo_da_prioridade_de_investimento__investment_priority_code AS code_of_category_intervention,
    prioridade_de_investimento__investment_priority AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    nuts_ii__nuts_2 AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    nuts_iii__nuts_3 AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho__municipality AS operation_lau1_name,
    NULL AS operation_lau2_code,
    freguesia__parrish AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo_total_aprovado__total_approved_fund_eur::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    codigo_da_operacao__operation_code AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    prioridade_de_investimento__investment_priority AS economic_dimension,
    '2014PT16M2OP005' AS cci,
    '2014PT16M2OP005_1' AS data_source
  FROM raw."2014PT16M2OP005_1"
),

"2014PT16M2OP006_1" AS (
  SELECT
    nome_da_operacao_operation_name AS operation_name,
    nome_do_beneficiario_beneficiary_name AS beneficiary_name,
    resumo_da_operacao_operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_inicio_startup_date") THEN to_timestamp_from_excel(TO_NUMBER("data_inicio_startup_date", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_fim_aprovada_end_of_operation_date") THEN to_timestamp_from_excel(TO_NUMBER("data_fim_aprovada_end_of_operation_date", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    despesas_elegiveis_totais_aprovada_total_eligible_costs_aprove::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN taxa_de_cofinanciamento_do_eixo_do_po_axis_eu_cofinancing_rate::DECIMAL > 1.0 THEN taxa_de_cofinanciamento_do_eixo_do_po_axis_eu_cofinancing_rate::DECIMAL
      ELSE taxa_de_cofinanciamento_do_eixo_do_po_axis_eu_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    codigo_postal_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    categoria_de_intervencao__intervention_area name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho_county AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    codigo_postal_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    fundo_aprovado_fund::DECIMAL AS eu_subsidy_value,
    nif AS beneficiary_id,
    no_projecto_number_of_project AS operation_id,
    eixo_prioritario_do_po_priority_axis_of_the_op AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP006' AS cci,
    '2014PT16M2OP006_1' AS data_source
  FROM raw."2014PT16M2OP006_1"
),

"2014PT16M2OP007_1" AS (
  SELECT
    designacao_da_operacao AS operation_name,
    NULL AS beneficiary_name,
    resumo_da_operacao AS operation_summary,
    CASE
      WHEN is_numeric("data_de_inicio") THEN to_timestamp_from_excel(TO_NUMBER("data_de_inicio", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_de_fim") THEN to_timestamp_from_excel(TO_NUMBER("data_de_fim", '99999D9')::INTEGER)::DATE
      ELSE NULL::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    CASE
      WHEN is_numeric(investimento_elegivel) THEN investimento_elegivel::DECIMAL
      ELSE NULL::DECIMAL
    END AS operation_total_expenditure,
    CASE
      WHEN is_numeric(taxa_de_cofinancia_mento) AND taxa_de_cofinancia_mento::DECIMAL > 1.0 THEN taxa_de_cofinancia_mento::DECIMAL
      WHEN is_numeric(taxa_de_cofinancia_mento) AND taxa_de_cofinancia_mento::DECIMAL < 1.0 THEN taxa_de_cofinancia_mento::DECIMAL*100.0
      ELSE NULL::DECIMAL
    END AS eu_cofinancing_rate,
    NULL AS country,
    concelho AS operation_location,
    NULL AS code_of_category_intervention,
    tipologia_de_intervencao AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'PT' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    concelho AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    CASE
      WHEN is_numeric(fundo_total_aprovado) THEN fundo_total_aprovado::DECIMAL
      ELSE NULL::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    codigo_da_operacao AS operation_id,
    prioridade_de_investimento_pi AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16M2OP007' AS cci,
    '2014PT16M2OP007_1' AS data_source
  FROM raw."2014PT16M2OP007_1"
  -- TODO: HERE ARE SUSPEVTED TO BE SUMMARY ROWS NEEDS A SOLUTION TO FILTER
),

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

"2014SK16M1OP002_1" AS (
  SELECT
    nazov_projektu__operation_name AS operation_name,
    meno_prijimatela__beneficiary_name AS beneficiary_name,
    zhrnutie_projektu_max_2_000_znakov__operation_summary_max_2_00 AS operation_summary,
    CASE
      WHEN is_numeric("datum_zacatia_projektu__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("datum_zacatia_projektu__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_zacatia_projektu__operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("datum_ukoncenia_projektu__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("datum_ukoncenia_projektu__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("datum_ukoncenia_projektu__operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    celkove_opravnene_vydavky__total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN miera_spolufinancovania_eu__union_cofinancing_rate::DECIMAL > 1.0 THEN miera_spolufinancovania_eu__union_cofinancing_rate::DECIMAL
      ELSE miera_spolufinancovania_eu__union_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    krajina__country AS country,
    psc_projektu_alebo_iny_vhodny_ukazovatel_miesta__operation_pos AS operation_location,
    NULL AS code_of_category_intervention,
    kategoria_intervencie__name_of_category_of_intervention_for_th AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    psc_projektu_alebo_iny_vhodny_ukazovatel_miesta__operation_pos AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    itms_kod__itms_code AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16M1OP002' AS cci,
    '2014SK16M1OP002_1' AS data_source
  FROM raw."2014SK16M1OP002_1"
),

"2014SK16RFOP002_1" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_1' AS data_source
  FROM raw."2014SK16RFOP002_1"
  WHERE missing_column_name_2 != 'Spolu'
),

"2014SK16RFOP002_2" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_2' AS data_source
  FROM raw."2014SK16RFOP002_2"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_3" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_3' AS data_source
  FROM raw."2014SK16RFOP002_3"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_4" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_4' AS data_source
  FROM raw."2014SK16RFOP002_4"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_5" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_5' AS data_source
  FROM raw."2014SK16RFOP002_5"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_6" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_6' AS data_source
  FROM raw."2014SK16RFOP002_6"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_7" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_7' AS data_source
  FROM raw."2014SK16RFOP002_7"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_8" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_8' AS data_source
  FROM raw."2014SK16RFOP002_8"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK16RFOP002_9" AS (
  SELECT
    nazov_ziadosti_o_nfp AS operation_name,
    nazov_ziadatela AS beneficiary_name,
    opis_projektu AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL / GREATEST(REPLACE(REPLACE(REPLACE(zazmluvnene_celkove_opravnene_vydavky_eur,' ',''),' ',''),',','.')::DECIMAL,1.0)*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'SK' AS operation_nuts0,
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
    REPLACE(REPLACE(REPLACE(zazmluvneny_nenavratny_financny_prispevok_eur,' ',''),' ',''),',','.')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK16RFOP002' AS cci,
    '2014SK16RFOP002_9' AS data_source
  FROM raw."2014SK16RFOP002_9"
  WHERE nazov_ziadosti_o_nfp IS NOT NULL
),

"2014SK_1" AS (
  SELECT
    nzov_projektu__operation_name AS operation_name,
    nzov_prjemcu__beneficiary_name AS beneficiary_name,
    opis_projektu__operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("zaiatok__operation_start_date") THEN to_timestamp_from_excel(TO_NUMBER("zaiatok__operation_start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("zaiatok__operation_start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("koniec__operation_end_date") THEN to_timestamp_from_excel(TO_NUMBER("koniec__operation_end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("koniec__operation_end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    celkov_nrokovaten_vdaje_pridelen_na_projekt__total_eligible_ex::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN miera_spolufinancovania_zo_strany_nie__expeditures_allocated_t::DECIMAL > 1.0 THEN miera_spolufinancovania_zo_strany_nie__expeditures_allocated_t::DECIMAL
      ELSE miera_spolufinancovania_zo_strany_nie__expeditures_allocated_t::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    miesta_realizcie AS operation_location,
    NULL AS code_of_category_intervention,
    oblasti_intervencie__intervention_field__name AS name_of_category_intervention,
    TO_DATE("dtum_poslednej_aktualizcie__date_of_last_update_of_the_list_of",'DD.MM.YYYY') AS date_of_last_update,
    'SK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    miesta_realizcie AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    io__identification_number_of_the_beneficiary AS beneficiary_id,
    NULL AS operation_id,
    prioritn_os__priority_axes_name AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014SK' AS cci,
    '2014SK_1' AS data_source
  FROM raw."2014SK_1"
),

"2014UK16RFOP001_1" AS (
  SELECT
    name_of_project AS operation_name,
    recipient_of_funds AS beneficiary_name,
    summary_of_project_max_100_words AS operation_summary,
    start_date::DATE AS operation_start_date,
    end_date::DATE AS operation_end_date,
    'GBP' AS currency,
    total_project_costs_psm::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN _of_project_funded_by_eu::DECIMAL > 1.0 THEN _of_project_funded_by_eu::DECIMAL
      ELSE _of_project_funded_by_eu::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    location_postcode AS operation_location,
    NULL AS code_of_category_intervention,
    type_and_focus_of_support_category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    location_postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    erdfesf_investment_psm::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP001' AS cci,
    '2014UK16RFOP001_1' AS data_source
  FROM raw."2014UK16RFOP001_1"
  WHERE recipient_of_funds != 'Bénéficiaire'
),

"2014UK16RFOP002_1" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    CASE
      WHEN is_numeric("start_date") THEN to_timestamp_from_excel(TO_NUMBER("start_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("start_date",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("end_date") THEN to_timestamp_from_excel(TO_NUMBER("end_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("end_date",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    'GBP' AS currency,
    REPLACE(SPLIT_PART(total_ps,' (',1),',','')::DECIMAL AS operation_total_expenditure,
    REPLACE(SPLIT_PART(eu_ps_30,' (',1),',','')::DECIMAL / REPLACE(SPLIT_PART(total_ps,' (',1),',','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    REPLACE(SPLIT_PART(eu_ps_30,' (',1),',','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_1' AS data_source
  FROM raw."2014UK16RFOP002_1"
  WHERE project_no != 'Last update: 13/11/2019'
),

"2014UK16RFOP002_2" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'GBP' AS currency,
    REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL / REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    intervention AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_no AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_2' AS data_source
  FROM raw."2014UK16RFOP002_2"
  WHERE project_no != 'Last update: 28/05/2020'
    AND sponsor != 'TOTALS:'
),

"2014UK16RFOP002_3" AS (
  SELECT
    project_name AS operation_name,
    sponsor AS beneficiary_name,
    NULL AS operation_summary,
    NULL::DATE AS operation_start_date,
    NULL::DATE AS operation_end_date,
    'GBP' AS currency,
    REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL AS operation_total_expenditure,
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL / REPLACE(REPLACE(total_ps,',',''),' ','')::DECIMAL*100.0 AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
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
    REPLACE(REPLACE(eu_ps,',',''),' ','')::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    project_no AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK16RFOP002' AS cci,
    '2014UK16RFOP002_3' AS data_source
  FROM raw."2014UK16RFOP002_3"
  WHERE project_no != 'Last update: 08/11/2019'
    AND sponsor != 'TOTALS:'
),

"2014UK16RFOP004_1" AS (
  SELECT
    operation_name AS operation_name,
    recipient_organisation1 AS beneficiary_name,
    description AS operation_summary,
    TO_DATE(REPLACE(REPLACE(SPLIT_PART(REPLACE("start_and_end_dates",'–','-'),'-',1),' ',''),'331','31'),'DD.MM.YYYY')::DATE AS operation_start_date,
    TO_DATE(REPLACE(REPLACE(SPLIT_PART(REPLACE("start_and_end_dates",'–','-'),'-',2),' ',''),'331','31'),'DD.MM.YYYY')::DATE AS operation_end_date,
    'GBP' AS currency,
    total_eligible_expenditure::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate::DECIMAL > 1.0 THEN union_cofinancing_rate::DECIMAL
      ELSE union_cofinancing_rate::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    postcode AS operation_location,
    NULL AS code_of_category_intervention,
    categories_of_intervention_2 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    categories_of_intervention AS operation_nuts2_code,
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
    esf_erdf_grant_requested::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    investment_priority AS priority_axis,
    categories_of_intervention_5 AS form_of_finance,
    categories_of_intervention_6 AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    categories_of_intervention_7 AS economic_dimension,
    '2014UK16RFOP004' AS cci,
    '2014UK16RFOP004_1' AS data_source
  FROM raw."2014UK16RFOP004_1"
  WHERE recipient_organisation1 NOT IN ('Recipient organisation', '1 See Sheet2 for the data fields in other languages')
    AND union_cofinancing_rate IS NOT NULL
),

"2014UK_1" AS (
  SELECT
    project_title AS operation_name,
    lead_organisation AS beneficiary_name,
    project_description AS operation_summary,
    project_start_date::DATE AS operation_start_date,
    project_end_date::DATE AS operation_end_date,
    'GBP' AS currency,
    total_project_cost::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_as_per_priority_axis::DECIMAL > 1.0 THEN union_cofinancing_rate_as_per_priority_axis::DECIMAL
      ELSE union_cofinancing_rate_as_per_priority_axis::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    regional_areas AS operation_location,
    NULL AS code_of_category_intervention,
    category_of_intervention AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'UK' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    regional_areas AS operation_nuts2_name,
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
    eu_funds_awarded::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    case_id AS operation_id,
    priority AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014UK' AS cci,
    '2014UK_1' AS data_source
  FROM raw."2014UK_1"
  WHERE total_project_cost != 'Total Project cost'
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
  UNION ALL
  SELECT * FROM "2014IE16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014IE16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014ITERDFTC_1"
  UNION ALL
  SELECT * FROM "2014ITERDF_1"
  UNION ALL
  SELECT * FROM "2014ITESF_1"
  UNION ALL
  SELECT * FROM "2014LU16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014LV16MAOP001_1"
  UNION ALL
  SELECT * FROM "2014NL16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014NL16RFOP003_1"
  UNION ALL
  SELECT * FROM "2014NL16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP001_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP005_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP006_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP007_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP008_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP009_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP010_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP011_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP012_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP013_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP014_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP015_1"
  UNION ALL
  SELECT * FROM "2014PL16M2OP016_1"
  UNION ALL
  SELECT * FROM "2014PL16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014PL16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014PL16RFOP003_1"
  -- UNION ALL
  -- SELECT * FROM "2014PT16CFOP001"
  -- TODO: WHY IS THIS MISSING?
  UNION ALL
  SELECT * FROM "2014PT16M2OP001_3"
  UNION ALL
  SELECT * FROM "2014PT16M2OP001_4"
  UNION ALL
  SELECT * FROM "2014PT16M2OP001_5"
  UNION ALL
  SELECT * FROM "2014PT16M2OP001_6"
  UNION ALL
  SELECT * FROM "2014PT16M2OP001_7"
  UNION ALL
  SELECT * FROM "2014PT16M2OP003_1"
  UNION ALL
  SELECT * FROM "2014PT16M2OP005_1"
  UNION ALL
  SELECT * FROM "2014PT16M2OP006_1"
  UNION ALL
  SELECT * FROM "2014PT16M2OP007_1"
  UNION ALL
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
  UNION ALL
  SELECT * FROM "2014SI16MAOP001_1"
  UNION ALL
  SELECT * FROM "2014SK16M1OP002_1"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_2"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_3"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_4"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_5"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_6"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_7"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_8"
  UNION ALL
  SELECT * FROM "2014SK16RFOP002_9"
  UNION ALL
  SELECT * FROM "2014SK_1"
  UNION ALL
  SELECT * FROM "2014UK16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_2"
  UNION ALL
  SELECT * FROM "2014UK16RFOP002_3"
  UNION ALL
  SELECT * FROM "2014UK16RFOP004_1"
  UNION ALL
  SELECT * FROM "2014UK_1"

)

SELECT
  *
FROM vw;