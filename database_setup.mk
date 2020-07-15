\SHELL=/bin/bash

# The controller script for preparing the database,
# creating schemas and loading the source master data
# sheet that contains the endpoints and supporting
# information about the endpoints / files themselves.

TODAY:=$(shell date +"%Y_%m_%d")
TS_NOW:=$(shell date +"%Y_%m_%d_%H_%M_%S")
LOG_DATE_FORMAT='%Y-%m-%d %H:%M:%S'

MD5_HASH:=$(TS_NOW) | md5sum | cut -c 1-32
SESSION_ID:=$(shell echo $(MD5_HASH))

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

DB_ACCESS=PGOPTIONS="-c statement_timeout=0" psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) -v ON_ERROR_STOP=1

create_source_master: start
	$(DB_ACCESS) < script/source_master/1_table.sql
	$(DB_ACCESS) < script/source_master/2_load.sql
	$(DB_ACCESS) < script/source_master/3_real.sql
	$(DB_ACCESS) < script/source_master/4_dump.sql

start:
	$(DB_ACCESS) < script/schemas/1_create.sql
	$(DB_ACCESS) < script/udfs/safe_cast.sql
	$(DB_ACCESS) < script/udfs/to_timestamp_from_excel.sql