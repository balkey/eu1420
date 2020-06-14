#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import csv
import json
import itertools
import logging
from functools import wraps
from shutil import copyfile
from utils import *
import os
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
			row_length = len([i for i in row if str(i).strip() != '' and str(i) != 'None' and i is not None])
			if row_length > max_length:
				dicto.append(i)
				max_length = row_length
	
	detected_headers = os.path.join(dirpath_target,'detected_headers')
	final_headers = os.path.join(dirpath_target,'final_headers')
	create_directory(detected_headers)
	create_directory(final_headers)
	
	detected_headers_file = os.path.join(detected_headers,filename)
	with open(detected_headers_file, 'w+', encoding='utf-8') as fo:
	#with open(detected_headers_file, 'w+', encoding='utf-8') as fo:
		writer = csv.writer(fo, delimiter=',')
		if len(dicto) > 0:
			header_config = []
			for i in dicto:
				with open(filepath_source, 'r+', encoding='utf-8') as ff:
					detected_header_row_nr = i
					detected_header_content = next(itertools.islice(csv.reader(ff), i, None))
					detected_header_content_clean = [i.replace('\r', ' ').replace('\n', ' ') for i in detected_header_content]
					header_config.append({"row_number": i, "content": detected_header_content_clean, "content_width": len(detected_header_content_clean)})
			json.dump(header_config, fo, indent=4, sort_keys=True, ensure_ascii=False)
			#writer.writerow(detected_header_content_clean)

	copyfile(filepath_source, filepath_target)

for dirpath, dirnames, filenames in os.walk("./data/encoded/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['csv']]:
		print(os.path.join(dirpath, filename))
		try:
			get_header(dirpath, filename)
		except Exception as e:
			print("Error")
			print(e)