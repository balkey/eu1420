SHELL=/bin/bash

scaffold: download_source
	python lib/download_source.py

download_source: clean
	python3 lib/download_gsheet.py -k config/client_secret.json -s 1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk -w OPERATIONS_LIST -o data/source/operations_list.csv

clean:
	#rm -rf data/source/*