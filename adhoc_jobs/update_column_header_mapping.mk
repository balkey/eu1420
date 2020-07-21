SHELL=/bin/bash


# This script can be run manually to update column header mapping
# used between source content and final database tables.

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

DB_ACCESS=PGOPTIONS="-c statement_timeout=0" psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) -v ON_ERROR_STOP=1
TARGET_SHEET_ID='1cdzdbCMk5faY77_MPwnuYzFtW14_brak5oLKz8XrKU4'
TARGET_WORKSHEET_ID='Individual column names'

dump: load_current_mapping
	python lib/dump_to_gsheet.py -i data/adhoc/real_column_header_mapping.csv -s $(TARGET_SHEET_ID) -w $(TARGET_WORKSHEET_ID)

create_new_mapping: load_current_mapping
	$(DB_ACCESS) < script/adhoc/column_header_mapping/3_real.sql

load_current_mapping: load_fresh
	$(DB_ACCESS) < script/adhoc/column_header_mapping_mapped/1_table.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping_mapped/2_load.sql

load_fresh: download_current_mapping
	$(DB_ACCESS) < script/adhoc/column_header_mapping/1_table.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping/2_load.sql

download_current_mapping: start
	python3 lib/download_gsheet.py -k config/client_secret.json -s 1cdzdbCMk5faY77_MPwnuYzFtW14_brak5oLKz8XrKU4 -w 'Individual column names' -o data/adhoc/column_header_mapping_mapped.csv

start:
	python lib/adhoc/prepare_header_mapping.py