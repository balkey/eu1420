SHELL=/bin/bash


# This script can be run manually to update column header mapping
# used between source content and final database tables.

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

DB_ACCESS=PGOPTIONS="-c statement_timeout=0" psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) -v ON_ERROR_STOP=1
TARGET_SHEET_ID='1cdzdbCMk5faY77_MPwnuYzFtW14_brak5oLKz8XrKU4'
TARGET_WORKSHEET_ID='Individual column names'

dump: load
	python lib/dump_to_gsheet.py -i data/adhoc/real_column_header_mapping.csv -s $(TARGET_SHEET_ID) -w $(TARGET_WORKSHEET_ID)

load: start
	$(DB_ACCESS) < script/adhoc/column_header_mapping/1_table.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping/2_load.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping/3_real.sql

start:
	python lib/adhoc/prepare_header_mapping.py