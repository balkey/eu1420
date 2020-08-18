DROP TABLE IF EXISTS real.operations_gr;

CREATE TABLE real.operations_gr AS
WITH
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

vw AS (
  SELECT * FROM "2014GR16M2OP001_1"
  UNION ALL
  SELECT * FROM "2014GR16M2OP007_1"
)

SELECT
  *
FROM vw;
