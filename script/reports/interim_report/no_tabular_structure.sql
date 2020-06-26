WITH
no_tabular_files AS (
  SELECT '2014PL16M2OP007_2' AS file
  UNION ALL
  SELECT '2014GR16M2OP007_2' AS file
  UNION ALL
  SELECT '2014EE16M3OP001_1' AS file
  UNION ALL
  SELECT '2014CZ_2' AS file
  UNION ALL
  SELECT '2014TC16RFCB047_2' AS file
  UNION ALL
  SELECT '2014TC16RFCB039_7' AS file
  UNION ALL
  SELECT '2014TC16RFCB006_2' AS file
  UNION ALL
  SELECT '2014TC16RFPC001_2' AS file
  UNION ALL
  SELECT '2014RO_15' AS file
  UNION ALL
  SELECT '2014RO_14' AS file
  UNION ALL
  SELECT '2014RO_11' AS file
  UNION ALL
  SELECT '2014RO_16' AS file
  UNION ALL
  SELECT '2014RO_17' AS file
  UNION ALL
  SELECT '2014RO_4' AS file
  UNION ALL
  SELECT '2014PT16M2OP007_2' AS file
  UNION ALL
  SELECT '2014PT16M2OP007_3' AS file
  UNION ALL
  SELECT '2014PT16CFOP001_1' AS file
  UNION ALL
  SELECT '2014UK16RFOP004_2' AS file
  UNION ALL
  SELECT '2014UK_2' AS file
  UNION ALL
  SELECT '2014HU_2' AS file
  UNION ALL
  SELECT '2014DE16RFOP005_2' AS file
),

no_tabular_transformed AS (
  SELECT
    *,
    SPLIT_PART(file, '_', 1) AS programme_code,
    SPLIT_PART(file, '_', 2) AS file_sheet_index  
  FROM no_tabular_files
),

vw AS (
  SELECT
    s.country,
    s.reference,
    s.reference_array,
    s.endpoint,
    t.*
  FROM no_tabular_transformed AS t
  LEFT JOIN real.source_master AS s ON t.programme_code = s.reference
)

SELECT
  country,
  reference,
  reference_array,
  endpoint,
  file_sheet_index
FROM vw
ORDEr BY 1,2,5;