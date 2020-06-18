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
source_folder = confs['INPUT_SAFE_FOLDER']
target_folder = confs['INPUT_FINAL_FOLDER']

def transform_postgresheader(header_list):
	pheader = []
	for i in header_list:
		no_space = i.lower().strip().replace(' ','_')
		single_underscore = re.sub('\_\_+', '_', no_space)
		no_accent = unidecode.unidecode(single_underscore)
		alnum_underscore = ''.join(e for e in no_accent if re.match(r'^\w+$', e))
		short_version = '%.62s' % alnum_underscore
		pheader.append(short_version)
	return pheader

def write_sql_table_scripts(json_obj, dirpath):
	with open(os.path.join(dirpath, '1_table.sql'), 'w+') as infile:
		infile.write('DROP TABLE IF EXISTS raw.'+str(json_obj[0]['table_name']+';\n'))
		infile.write('\n')
		infile.write('CREATE TABLE raw.'+str(json_obj[0]['table_name']+' (\n'))
		for i in json_obj[0]['pheader'][:-1]:
			infile.write('  '+str(i)+' TEXT COLLATE "default",\n')
		infile.write('  '+str(json_obj[0]['pheader'][-1])+' TEXT COLLATE "default"\n')
		infile.write(')\n')
		infile.write('\n')
		infile.write('WITH(OIDS=false);\n')

def write_sql_load_scripts(json_obj, dirpath):
	with open(os.path.join(dirpath, '2_load.sql'), 'w+') as infile:
		joined_header = ",".join(json_obj[0]['pheader'])
		infile.write('\\copy raw.'+json_obj[0]['table_name'])
		infile.write(' ('+joined_header+')')
		infile.write(" FROM '"+json_obj[0]['file_name']+"'")
		infile.write(" DELIMITER ',' CSV HEADER;\n")

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in [f for f in filenames if f.split('.')[-1] in ['json', 'csv']]:
		pre, ext = os.path.splitext(filename)
		filepath_source  = os.path.join(dirpath, filename)
		dirpath_target_base = dirpath.replace(source_folder, target_folder)
		dirpath_target = os.path.join(dirpath_target_base, pre)
		filepath_target = os.path.join(dirpath_target, filename)
		if not os.path.exists(dirpath_target):
			os.makedirs(dirpath_target)

		if filename.split('.')[-1] == 'json':
			with open(os.path.join(dirpath,filename), 'r') as json_file:
				data = json.load(json_file)
				if len(data) > 0:
					data[0]['file_name'] = os.path.join(dirpath,pre + '_clean.csv')
					data[0]['table_name'] = pre
					raw_content = data[0]['content']
					data[0]['pheader'] = transform_postgresheader(raw_content)
					write_sql_table_scripts(data, dirpath_target)
					write_sql_load_scripts(data, dirpath_target)
				else:
					pass
			with open(filepath_target, 'w+') as fo:
				json.dump(data, fo, indent=4, sort_keys=True, ensure_ascii=False)
		else:
			copyfile(filepath_source,filepath_target)
