#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This is a controller script, that ensures that all
input files contain only the specified columns.
If a column is not specified, it will be discarded from
the final output.
The input of this script is a .json file. This needs to contain the
following fields:
	- pheader: a list array containing the valid header values
	- empty_columns: a list array containing which columns should be discarded,
		even if they are a member of pheader values
	- clean_file_name: the input file of the function
	- final_file_name: the output file of the function
'''

import csv
import os
import itertools
from utils import *
import subprocess

os.environ["PYTHONIOENCODING"] = "utf-8"

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

os.system('chmod +x ./cut_csv_columns.sh')

for dirpath, dirnames, filenames in os.walk(source_folder):
	if not dirnames:
		for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
			pre, ext = os.path.splitext(filename)
			with open(os.path.join(dirpath,filename), 'r') as json_file:
				conf_data = json.load(json_file)
				if len(conf_data) > 0:
					pheader = conf_data[0]['pheader']
					empty_columns = conf_data[0]['empty_columns']
					file_name = conf_data[0]['clean_file_name']
					final_file_name = conf_data[0]['final_file_name']
					valid_columns = [i for i in pheader if i not in empty_columns]
					if len(valid_columns) > 0:
						os.putenv('COLUMNS', ','.join(valid_columns))
						os.putenv('FILE_NAME', file_name)
						os.putenv('FINAL_FILE_NAME', final_file_name)
						subprocess.call('./cut_csv_columns.sh')
					else:
						pass
						