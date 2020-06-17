SHELL=/bin/bash
prepare_final: detect_header
	rm -rf data/input/* && mkdir -p data/input
	python lib/scaffold.py -s 'INPUT_FOLDER'
	python lib/rename_and_copy.py

detect_header: encode
	rm -rf data/header_detected/* && mkdir -p data/header_detected
	python lib/scaffold.py -s 'HEADER_DETECTED_FOLDER'
	python lib/detect_header.py

encode: make_csv
	#rm -rf data/encoded/* && mkdir -p data/encoded
	#python lib/scaffold.py -s 'ENCODED_FOLDER'
	#python lib/encode.py

make_csv: uncompress
	#rm -rf data/converted/* && mkdir -p data/converted
	#python lib/scaffold.py -s 'CONVERTED_FOLDER'
	#python lib/converter_controler.py
	#python lib/remove_empty_files.py

uncompress: download
	#python lib/uncompress.py

download: database_setup
	#python lib/scaffold.py -s 'DOWNLOAD_FOLDER'
	#python lib/download_source.py

database_setup: download_source
	#make -f database_setup.mk

download_source: clean
	#python3 lib/download_gsheet.py -k config/client_secret.json -s 1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk -w OPERATIONS_LIST -o data/source/operations_list.csv

clean: start
	#mkdir -p tmp
	#mv data/source/HU tmp/
	# Make sure that here ^
	# you include all the manually collected files.
	#rm -rf data/* && mkdir data/source
	#mv tmp/* data/source/ && rm -rf tmp

start:
	# Make sure you copy all the manually collected files to data/source
	# Make sure you keep the data/source/[COUNTRY_CODE]/[PROGAME_CODE]/file.xlsx convention!