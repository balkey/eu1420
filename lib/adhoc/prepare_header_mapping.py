#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script collects:
	- country_codes
	- CCI codes
	- approved headers
	- transformed headers (PostgreSQL compatible)

Finally the script saves the results in a .csv format

The purpose is to provide a base table for mapping columns manually.
'''

import os
import sys 
sys.path.insert(0,str(os.getcwd()))

import csv
import itertools
from lib.utils import *

os.environ["PYTHONIOENCODING"] = "utf-8"

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

output_file = 'data/adhoc/raw_column_header_mapping.csv'

with open(output_file, 'w+') as of:
	writer = csv.writer(of)
	writer.writerow(['country_code', 'programme_code', 'table_name', 'original_header', 'pheader'])
	for dirpath, dirnames, filenames in os.walk(source_folder):
		if not dirnames:
			for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
				pre, ext = os.path.splitext(filename)
				with open(os.path.join(dirpath,filename), 'r') as json_file:
					conf_data = json.load(json_file)
					if len(conf_data) > 0:
						table_name = conf_data[0]['table_name']
						programme_code = table_name.split('_')[0]
						country_code = table_name[4:6]
						original_header = conf_data[0]['content'] 
						pheader = conf_data[0]['pheader']
						empty_columns = conf_data[0]['empty_columns']
						for v,p in zip(original_header,pheader):
							if p not in empty_columns:
								writer.writerow([country_code,programme_code,table_name,v,p])
							else:
								pass
					else:
						pass
		else:
			pass
