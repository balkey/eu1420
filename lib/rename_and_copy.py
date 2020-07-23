#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
The script renames files with .csv and .json extensions
after the folder name they reside at.

Finally it copies them to a folder specified as "target_folder".
'''

import os
from shutil import copyfile
import logging
from utils import *
import re

logging.basicConfig(filename='logs/rename_and_copy.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']

source_folder = confs['HEADER_DETECTED_FOLDER']
target_folder = confs['INPUT_FOLDER']

def atoi(text):
	return int(text) if text.isdigit() else text

def natural_keys(text):
	return [atoi(c) for c in re.split(r'(\d+)', text)]

for dirpath, dirnames, filenames in os.walk(source_folder):
	valid_filenames = [f for f in filenames if f.split('.')[-1] in ['csv', 'json']]
	valid_filenames.sort(key=natural_keys)
	for index_nr, filename in enumerate(valid_filenames, start=1):
		file_type = dirpath.split('/')[-1]
		program_name = dirpath.split('/')[-2]
		if file_type == 'files':
			filename_final = program_name+'_'+str(index_nr)+'.csv'
		elif file_type == 'detected_headers':
			filename_final = program_name+'_'+str(index_nr)+'.json'
		else:
			pass
		filepath_source  = os.path.join(dirpath, filename)

		dirpath_target = dirpath.split(file_type)[0].replace(source_folder, target_folder)
		filepath_target = os.path.join(dirpath_target, filename_final)
		copyfile(filepath_source,filepath_target)
