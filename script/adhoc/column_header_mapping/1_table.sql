DROP TABLE IF EXISTS raw.column_header_mapping;

CREATE TABLE raw.column_header_mapping (
  country_code VARCHAR(2) COLLATE "default",
  programme_code VARCHAR(128) COLLATE "default",
  table_name VARCHAR(128) COLLATE "default",
  original_header TEXT COLLATE "default",
  pheader VARCHAR(64) COLLATE "default"
)

WITH(OIDS=false);