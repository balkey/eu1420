DROP TABLE IF EXISTS real.operations_pl;

CREATE TABLE real.operations_pl AS
WITH
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
    'PL' AS operation_nuts0,
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

vw AS (
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
)

SELECT
  *
FROM vw;
