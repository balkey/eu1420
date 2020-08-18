SHELL=/bin/bash

# ---------------README---------------
# The main controller script of the whole dataflow.

# Usage:

# 1. Force download of original source files
# (run without falling back to a previously generated data/source folder):
#	$ cd root_folder
# 	$ make FORCE_DOWNLOAD=1

# 2. Fall back to previously generated source files
# (make sure you have copied the data/source folder to the root folder):
#	$ cd root_folder
# 	$ make
# ---------------README---------------

ENVIRONMENT=config/env_prod.env

include $(ENVIRONMENT)
export

DB_ACCESS=PGOPTIONS="-c statement_timeout=0" psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_DATABASE) -v ON_ERROR_STOP=1

define \n


endef

# Make sure to include new countries here, if needed!
COUNTRY_LIST=AT \
	BE \
	BG \
	CZ \
	DE \
	DK \
	ES \
	FR \
	GR \
	HR \
	HU \
	IE \
	IT \
	LU \
	LV \
	NL \
	PL \
	PT \
	RO \
	SI \
	SK \
	UK \
	TC

export_results: construct_master_table
	mkdir -p data/exports
	$(DB_ACCESS) < script/real.operations/eu/2_dump.sql

construct_master_table: transform_countries
	$(DB_ACCESS) < script/real.operations/eu/1_query.sql
	
transform_countries: load
	$(foreach country, $(COUNTRY_LIST), $(DB_ACCESS) < script/real.operations/$(country)/1_query.sql $(\n))
	
load: tables
	. load.sh

tables: final
	. tables.sh

final: evaluate_final
	rm -rf data/input_final/* && mkdir -p data/input_final
	python lib/scaffold.py -s 'INPUT_FINAL_FOLDER'
	python lib/create_valid_headers.py
	python lib/cut_csv_rows.py
	python lib/log_empty_columns.py
	python lib/create_sql_files.py
	python lib/cut_csv_columns.py

evaluate_final: prepare_final
	rm -rf data/input_eval/* && mkdir -p data/input_eval
	python lib/scaffold.py -s 'INPUT_EVAL_FOLDER'
	python lib/evaluate_header.py

prepare_final: detect_header
	rm -rf data/input/* && mkdir -p data/input
	python lib/scaffold.py -s 'INPUT_FOLDER'
	python lib/rename_and_copy.py

detect_header: encode
	rm -rf data/header_detected/* && mkdir -p data/header_detected
	python lib/scaffold.py -s 'HEADER_DETECTED_FOLDER'
	python lib/detect_header.py

encode: make_csv
	rm -rf data/encoded/* && mkdir -p data/encoded
	python lib/scaffold.py -s 'ENCODED_FOLDER'
	python lib/encode.py

make_csv: uncompress
	rm -rf data/converted/* && mkdir -p data/converted
	python lib/scaffold.py -s 'CONVERTED_FOLDER'
	python lib/converter_controler.py
	python lib/remove_empty_files.py

uncompress: download
ifeq ($(FORCE_DOWNLOAD),1)
	@echo 'Uncompressing source files'
	python lib/uncompress.py
else
	@echo 'Falling back to previously uncompressed source files.'
endif

download: database_setup
ifeq ($(FORCE_DOWNLOAD),1)
	@echo 'Downloading source files'
	python lib/scaffold.py -s 'DOWNLOAD_FOLDER'
	python lib/download_source.py
else
	@echo 'Falling back to previous source files.'
endif

database_setup: download_source
	make -f database_setup.mk ENVIRONMENT=$(ENVIRONMENT)

download_source: clean
ifeq ($(FORCE_DOWNLOAD),1)
	@echo 'Downloading new source master.'
	python3 lib/download_gsheet.py -k config/client_secret.json -s 1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk -w OPERATIONS_LIST -o data/source/operations_list.csv
else
	@echo 'Falling back to previous source master.'
endif

clean: start
ifeq ($(FORCE_DOWNLOAD),1)
	@echo 'Data folder regenerated.'
	mkdir -p tmp
	mv data/source/HU tmp/
	mv data/source/GR tmp/
	
	@# Make sure that here ^
	@# you include all the manually collected files.
	
	rm -rf data/* && mkdir data/source
	mv tmp/* data/source/ && rm -rf tmp
else
	@echo 'Falling back on existing data folder.'
endif

start:
	@# Make sure you copy all the manually collected files to data/source
	@# Make sure you keep the data/source/[COUNTRY_CODE]/[PROGAME_CODE]/file.xlsx convention!
