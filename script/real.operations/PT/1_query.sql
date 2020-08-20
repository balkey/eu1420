DROP TABLE IF EXISTS real.operations_pt;

CREATE TABLE real.operations_pt AS
WITH
"2014PT16CFOP001_1" AS (
  SELECT
    nome_da_operacao__operation_name AS operation_name,
    nome_do_beneficiario__beneficiary_name AS beneficiary_name,
    resumo_da_operacao__operation_summary AS operation_summary,
    CASE
      WHEN is_numeric("data_de_aprovacao__approval_date") THEN to_timestamp_from_excel(TO_NUMBER("data_de_aprovacao__approval_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_de_aprovacao__approval_date",'DD-MM-YYYY')::DATE
    END AS operation_start_date,
    CASE
      WHEN is_numeric("data_de_fim_da_operacao__end_of_operation_date") THEN to_timestamp_from_excel(TO_NUMBER("data_de_fim_da_operacao__end_of_operation_date", '99999D9')::INTEGER)::DATE
      ELSE TO_DATE("data_de_fim_da_operacao__end_of_operation_date",'DD-MM-YYYY')::DATE
    END AS operation_end_date,
    'EUR' AS currency,
    REPLACE(REPLACE(despesas_elegiveis_totais__total_eligible_costs,'.',''),',','.')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(taxa_de_cofinanciamento_do_eixo_pela_eu__axis_eu_cofinancing_r,',','')::DECIMAL > 1.0 THEN REPLACE(taxa_de_cofinanciamento_do_eixo_pela_eu__axis_eu_cofinancing_r,',','')::DECIMAL
      ELSE REPLACE(taxa_de_cofinanciamento_do_eixo_pela_eu__axis_eu_cofinancing_r,',','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    pais__country AS country,
    NULL AS operation_location,
    NULL AS code_of_category_intervention,
    categoria_de_intervencao__intervention_area AS name_of_category_intervention,
    TO_DATE(data_de_exportacao__export_date,'DD-MM-YYYY H:M:SS') AS date_of_last_update,
    'PT' AS operation_nuts0,
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
    eixo_prioritario__priority_axis AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014PT16CFOP001' AS cci,
    '2014PT16CFOP001_1' AS data_source
  FROM raw."2014PT16CFOP001_1"
),

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
  WHERE is_numeric("data_de_inicio")
),

vw AS (
  SELECT * FROM "2014PT16CFOP001_1"
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
)

SELECT
  *
FROM vw;
