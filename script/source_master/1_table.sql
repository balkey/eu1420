DROP TABLE IF EXISTS raw.source_master CASCADE;

CREATE TABLE raw.source_master (
  country VARCHAR(32) COLLATE "default",
  reference VARCHAR(32) COLLATE "default",
  name TEXT COLLATE "default",
  list_of_operations_url TEXT COLLATE "default",
  download_url_plus_readable_format TEXT COLLATE "default",
  supervised_download_url TEXT COLLATE "default",
  endpoint TEXT COLLATE "default",
  access VARCHAR(32) COLLATE "default",
  anchor_text TEXT COLLATE "default",
  last_update DATE,
  fileformat VARCHAR(32) COLLATE "default",
  compressed INTEGER
)

WITH(OIDS=false);