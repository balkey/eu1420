DROP TABLE IF EXISTS real.operations_ski;

CREATE TABLE real.operations_sk AS
WITH
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

vw AS (
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
)

SELECT
  *
FROM vw;
