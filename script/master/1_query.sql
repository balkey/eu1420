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
)

SELECT
  *
FROM vw;