SHELL=/bin/bash


# This script can be run manually to update column header mapping
# used between source content and final database tables.

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

DB_ACCESS=PGOPTIONS="-c statement_timeout=0" psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) -v ON_ERROR_STOP=1


load: start
	$(DB_ACCESS) < script/adhoc/column_header_mapping/1_table.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping/2_load.sql
	$(DB_ACCESS) < script/adhoc/column_header_mapping/3_real.sql

start:
	python lib/adhoc/prepare_header_mapping.py