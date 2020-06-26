SELECT
  country,
  reference,
  reference_array 
FROM real.source_master
WHERE cardinality(reference_array) > 1
  AND "access" != 'missing';