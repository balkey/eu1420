#Usage: make -f adhoc_jobs/backup.mk

SHELL=/bin/bash

TODAY:=$(shell date +"%Y_%m_%d")

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

dump: start
	pg_dump -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) > db_dumps/$(TODAY)/database_export_$(TODAY).pgsql

start:
	@rm -rf db_dumps/$(TODAY)
	@mkdir -p db_dumps/$(TODAY)