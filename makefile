SHELL=/bin/bash



encode: make_csv
	#TODO

make_csv: uncompress
	python lib/converter_controler.py

uncompress: download
	python lib/uncompress.py

download: scaffold
	python lib/download_source.py

scaffold: database_setup
	python lib/scaffold.py	

database_setup: download_source
	make -f datababase_setup.mk

download_source: clean
	python3 lib/download_gsheet.py -k config/client_secret.json -s 1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk -w OPERATIONS_LIST -o data/source/operations_list.csv

clean: start
	mkdir -p tmp
	mv data/source/HU tmp/
	rm -rf data/* && mkdir data/source
	mv tmp/* data/source/ && rm -rf tmp

start:
	# Make sure you copy all the manually collected files to data/source
	# Make sure you keep the data/source/[COUNTRY_CODE]/[PROGAME_CODE]/file.xlsx convention!