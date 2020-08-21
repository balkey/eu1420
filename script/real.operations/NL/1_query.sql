DROP TABLE IF EXISTS real.operations_nl;

CREATE TABLE real.operations_nl AS
WITH
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
    CASE
      WHEN medefinancieringspercentage LIKE '%\%%' THEN  REPLACE(REPLACE(medefinancieringspercentage,',','.'),'%','')::DECIMAL
      ELSE REPLACE(REPLACE(medefinancieringspercentage,',','.'),'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
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

vw AS (
  SELECT * FROM "2014NL16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014NL16RFOP003_1"
  UNION ALL
  SELECT * FROM "2014NL16RFOP004_1"
)

SELECT
  *
FROM vw;
