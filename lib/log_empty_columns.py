#!/usr/bin/env python
# -*- coding: utf-8 -*-

import csv
import os
import itertools
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

def log_empty_columns(filepath):
	with open(filepath, 'r') as fi:
		header_dict = {}
		reader = csv.reader(fi)
		header = next(reader)
		for i in header:
			header_dict[i] = 0
		for row in reader:
			for index,cell in enumerate(row):
				stripped = str(cell).strip()
				if stripped is None or stripped == '' or \
				stripped.lower() == 'none' or \
				stripped.lower() == ' ' or \
				stripped.lower() == '\t' or \
				stripped.lower() == '\n' or \
				stripped.lower() == '\r':
					pass
				else:
					header_dict[header[index]] += 1
		empty_columns = [key for key in header_dict if header_dict[key] == 0]
		return empty_columns

for dirpath, dirnames, filenames in os.walk(source_folder):
	if not dirnames:
		#for filename in [f for f in filenames if f == '2014RO_8.json']:
		for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
			with open(os.path.join(dirpath,filename), 'r') as json_file:
				conf_data = json.load(json_file)
				if len(conf_data) > 0:
					empty_columns = log_empty_columns(conf_data[0]['clean_file_name'])
					if len(empty_columns) > 0:
						conf_data[0]['empty_columns'] = empty_columns
					else:
						conf_data[0]['empty_columns'] = []
				else:
					pass
			with open(os.path.join(dirpath,filename), 'w+') as fo:
				json.dump(conf_data, fo, indent=4, sort_keys=True, ensure_ascii=False)
	else:
		pass