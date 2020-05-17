SHELL=/bin/bash

scaffold: database_setup
	python lib/download_source.py

database_setup: download_source
	make -f datababase_setup.mk

download_source: clean
	python3 lib/download_gsheet.py -k config/client_secret.json -s 1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk -w OPERATIONS_LIST -o data/source/operations_list.csv

clean:
	rm -rf data/source/*