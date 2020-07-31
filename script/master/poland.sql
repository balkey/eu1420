WITH
"2014PL16M2OP006_1" AS (
  SELECT
    tytul_projektu AS operation_name,
    nazwa_wnioskodawcy AS beneficiary_name,
    NULL AS operation_summary,
    /*
    CASE
      WHEN is_numeric("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_rozpoczecia_realizacji_projektu_format_rrrrmmdd",'DD.MM.YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_zakonczenia_realizacji_projektu_format_rrrrmmdd") THEN to_timestamp_from_excel(TO_NUMBER("data_zakonczenia_realizacji_projektu_format_rrrrmmdd", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_zakonczenia_realizacji_projektu_format_rrrrmmdd",'DD.MM.YYYY')::DATE
    END AS operation_end_date,
    */
    'PLN' AS currency,
    REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')::DECIMAL AS operation_total_expenditure,
    (REPLACE(REPLACE(REPLACE(REPLACE(wartosc_unijnego_dofinansowania,'zł',''),',','.'),' ',''),' ','')::DECIMAL / REPLACE(REPLACE(REPLACE(REPLACE(wartosc_projektu,'zł',''),',','.'),' ',''),' ','')::DECIMAL)*100.0AS eu_cofinancing_rate,
    NULL AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    NULL AS name_of_category_intervention,
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
    --wartosc_unijnego_dofinansowania::DECIMAL AS eu_subsidy_value,
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
)

SELECT
  *
FROM "2014PL16M2OP006_1";

/*
SELECT
  *
FROM raw."2014PL16M2OP006_1";
*/