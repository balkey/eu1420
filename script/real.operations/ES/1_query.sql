DROP TABLE IF EXISTS real.operations_es;

CREATE TABLE real.operations_es AS
WITH
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

vw AS (
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
)

SELECT
  *
FROM vw;
