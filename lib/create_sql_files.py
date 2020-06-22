#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from shutil import copyfile
import logging
import json
from utils import *
import unidecode
import re
from shutil import copyfile

os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/enrich_json.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

def write_sql_table_scripts(json_obj, dirpath):
	with open(os.path.join(dirpath, '1_table.sql'), 'w+') as infile:
		valid_columns = [i for i in json_obj[0]['pheader'] if i not in json_obj[0]['empty_columns']]
		infile.write('DROP TABLE IF EXISTS raw."'+str(json_obj[0]['table_name']+'";\n'))
		infile.write('\n')
		infile.write('CREATE TABLE raw."'+str(json_obj[0]['table_name']+'" (\n'))
		for i in valid_columns[:-1]:
			infile.write('  "'+str(i)+'" TEXT COLLATE "default",\n')
		infile.write('  "'+str(valid_columns[-1])+'" TEXT COLLATE "default"\n')
		infile.write(')\n')
		infile.write('\n')
		infile.write('WITH(OIDS=false);\n')

def write_sql_load_scripts(json_obj, dirpath):
	with open(os.path.join(dirpath, '2_load.sql'), 'w+') as infile:
		valid_columns = ['"'+i+'"' for i in json_obj[0]['pheader'] if i not in json_obj[0]['empty_columns']]
		joined_header = ",".join(valid_columns)
		infile.write('\\copy raw."'+json_obj[0]['table_name']+'"')
		infile.write(' ('+joined_header+')')
		infile.write(" FROM '"+json_obj[0]['final_file_name']+"'")
		infile.write(" DELIMITER ',' CSV HEADER;\n")

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
		pre, ext = os.path.splitext(filename)
		filepath_source  = os.path.join(dirpath, filename)
		with open(os.path.join(dirpath,filename), 'r') as json_file:
			data = json.load(json_file)
			if len(data) > 0:
				valid_columns = [i for i in data[0]['pheader'] if i not in data[0]['empty_columns']]
				if len(valid_columns) > 0:
					write_sql_table_scripts(data, dirpath)
					write_sql_load_scripts(data, dirpath)
			else:
				pass