DROP TABLE IF EXISTS raw.column_header_mapping_mapped;

CREATE TABLE raw.column_header_mapping_mapped (
  pheader VARCHAR(64) COLLATE "default",
  original_header TEXT COLLATE "default",
  country_code TEXT COLLATE "default",
  programme_code TEXT COLLATE "default",
  table_name TEXT COLLATE "default",
  mapping VARCHAR(128) COLLATE "default" 
)

WITH(OIDS=false);