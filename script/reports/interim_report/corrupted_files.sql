SELECT
  country,
  reference,
  endpoint
FROM real.source_master
WHERE reference IN ('2014TC16RFCB017','2014TC16RFCB029','2014TC16RFCB025','2014TC16RFCB015')
ORDER BY 1,2;