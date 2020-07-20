#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This file contains logic that from a valid csv file
it will try to detect headers. The logic is the following:
	- 1. Iterate over all the rows of an input file
	- 2. Detect the length of the row containing non null values
	- 3. If the detected length is longer than the previously detected
		longest row, save it as a header candidate
	- 4. Set the longest row's value to the detected length.
	- 5. Save the row's rownumber within the file, the row's lenght and
		the row's contents into a .json file
'''

import os
import csv
import json
import itertools
import logging
from functools import wraps
from shutil import copyfile
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/header_detected.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['ENCODED_FOLDER']
target_folder = confs['HEADER_DETECTED_FOLDER']

def handle_exceptions(fn):
	@wraps(fn)
	def wrapper(*args, **kw):
		try:
			return fn(*args, **kw)
		except Exception as e:
            #exception_handler(self.log)
			#print(e)
			logging.error('Error occurred with dtecting header for file '+str(args[1])+' from folder '+str(args[0])+'. Message: '+str(e), exc_info=False)
	return wrapper

def create_directory(dirpath):
	if not os.path.exists(dirpath):
		os.makedirs(dirpath)

def name_missing_column_headers(header):
	counter = 1
	final_header = []
	for i in header:
		if i.strip() != '':
			final_header.append(i)
		else:
			final_header.append('missing_column_name_'+str(counter))
			counter +=1
	return final_header


@handle_exceptions
def get_header(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	
	with open(filepath_source, 'r+', encoding='utf-8') as f:
		reader = csv.reader(f)
		dicto = []
		max_length = 0
		for i, row in enumerate(reader):
			row_length = len(set([i for i in row if str(i).strip() != '' and str(i) != 'None' and i is not None]))
			if row_length > max_length:
				dicto.append(i)
				max_length = row_length
	
	detected_headers_folder = os.path.join(dirpath_target,'detected_headers')
	create_directory(detected_headers_folder)
	detected_headers_file = os.path.join(detected_headers_folder,filename)
	
	final_files_folder = os.path.join(dirpath_target,'files')
	create_directory(final_files_folder)
	final_files_file = os.path.join(final_files_folder,filename)

	detected_headers_file = os.path.join(detected_headers_folder,filename)	

	with open(detected_headers_file, 'w+', encoding='utf-8') as fo:
		writer = csv.writer(fo, delimiter=',')
		if len(dicto) > 0:
			header_config = []
			for i in dicto:
				with open(filepath_source, 'r+', encoding='utf-8') as ff:
					detected_header_row_nr = i
					detected_header_content = next(itertools.islice(csv.reader(ff), i, None))
					detected_header_content_clean_base = [i.replace('\r', ' ').replace('\n', ' ') for i in detected_header_content]
					detected_header_content_clean = name_missing_column_headers(detected_header_content_clean_base)
					header_config.append({"row_number": i, "content": detected_header_content_clean, "content_width": len(detected_header_content_clean)})
			json.dump(header_config, fo, indent=4, sort_keys=True, ensure_ascii=False)
	
	pre, ext = os.path.splitext(detected_headers_file)
	os.rename(detected_headers_file, pre + '.json')
	copyfile(filepath_source, final_files_file)

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in [f for f in filenames if f.split('.')[-1] in ['csv']]:
		print(os.path.join(dirpath, filename))
		try:
			get_header(dirpath, filename)
		except Exception as e:
			print("Error")
			print(e)