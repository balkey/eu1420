CREATE OR REPLACE FUNCTION to_timestamp_from_excel (ExcelDate integer)
RETURNS timestamp without time zone AS $$
BEGIN
  IF ExcelDate > 59 THEN
    ExcelDate = ExcelDate - 1;
  END IF;
  RETURN date '1899-12-31' + ExcelDate;
END;
$$ LANGUAGE plpgsql;