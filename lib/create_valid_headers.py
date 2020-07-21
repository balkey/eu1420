#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script ensures that a given header only contains elements / field names
that are accepted by PostgreSQL as column names.

Th input is a JSON object where "content" field need to contain the desired header
values as a list array.

The valid headers will be dumped to another .json file, where the transformed header values will
be included in the "pheader" field.
'''

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
source_folder = confs['INPUT_EVAL_FOLDER']
target_folder = confs['INPUT_FINAL_FOLDER']

def transform_postgresheader(header_list):
	pheader = []
	counter = 2
	for i in header_list:
		no_space = i.strip().replace(' ','_')
		single_underscore = re.sub('\_\_+', '_', no_space)
		no_accent = unidecode.unidecode(single_underscore)
		alnum_underscore = ''.join(e for e in no_accent if re.match(r'^\w+$', e))
		short_version = '%.62s' % alnum_underscore.lower()
		if short_version.isdigit():
			short_version = 'a_'+short_version
		else:
			pass
		if short_version in pheader:
			short_version = short_version+'_'+str(counter)
			counter+=1
		else:
			pass
		pheader.append(short_version)
	return pheader

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
					#print(os.path.join(dirpath_target,pre+'_clean.csv'))
					data[0]['clean_file_name'] = os.path.join(dirpath_target,pre+'_clean.csv')
					data[0]['final_file_name'] = os.path.join(dirpath_target,pre+'_final.csv')
					data[0]['table_name'] = pre
					raw_content = data[0]['content']
					data[0]['pheader'] = transform_postgresheader(raw_content)
				else:
					pass
			with open(filepath_target, 'w+') as fo:
				json.dump(data, fo, indent=4, sort_keys=True, ensure_ascii=False)
		else:
			copyfile(filepath_source,filepath_target)
