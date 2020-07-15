#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This scripts converts a .csv file into UTF-8
and tries to detect the used delimiter in the 
.csv file based on the first 2MB of data.
'''

import logging
from functools import wraps
from utils import *
import chardet
from itertools import islice
import chardet
import os
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/encoded.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['CONVERTED_FOLDER']
target_folder = confs['ENCODED_FOLDER']

sniffer = csv.Sniffer()

def handle_exceptions(fn):
	@wraps(fn)
	def wrapper(*args, **kw):
		try:
			return fn(*args, **kw)
		except Exception as e:
			logging.error('Error occurred with encoding file '+str(args[1])+' from folder '+str(args[0])+'. Message: '+str(e), exc_info=False)
	return wrapper

def predict_encoding(file_path, n_lines=200):
	with open(file_path, 'rb') as f:
		rawdata = b''.join([f.readline() for _ in range(n_lines)])
		detected_encoding = chardet.detect(rawdata)['encoding']
		if detected_encoding is None:
			detected_encoding = 'utf-8'
	return detected_encoding

@handle_exceptions
def detect_delimiter(text_sample, filepath_source):
	dialect = sniffer.sniff(text_sample)
	try:
		delimiter_used = dialect.delimiter
	except:
		delimiter_used = ','
	if delimiter_used is None or delimiter_used.strip() == '' or delimiter_used.strip is None:
		delimiter_used = ','
	else:
		delimiter_used = dialect.delimiter
	print(filepath_source)
	print(delimiter_used)
	return delimiter_used

@handle_exceptions
def encodefile(dirpath, filename, encoding):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)

	with open(filepath_source,'r', encoding='utf-8', errors='ignore') as fi, open(filepath_target, 'w+') as fo:
		text_sample = fi.read(1024**2)
		fi.seek(0)
		delimiter_used = detect_delimiter(text_sample, filepath_source)
		reader=csv.reader(fi, delimiter=delimiter_used)
		writer = csv.writer(fo, delimiter=',')
		for row in reader:
			writer.writerow(row)

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in filenames:
		encodefile(dirpath, filename, 'utf-8')
