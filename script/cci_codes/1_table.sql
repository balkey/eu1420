DROP TABLE IF EXISTS raw.cci_codes;

CREATE TABLE raw.cci_codes (
  country_code VARCHAR(24) COLLATE "default",
  cci_code VARCHAR(24) COLLATE "default",
  programme_title TEXT COLLATE "default"
)

WITH(OIDS=false);