#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import logging
from functools import wraps
from utils import *
import chardet
from itertools import islice

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
            #exception_handler(self.log)
			#print(e)
			logging.error('Error occurred with encoding file '+str(args[1])+' from folder '+str(args[0])+'. Message: '+str(e), exc_info=False)
	return wrapper

def predict_encoding(file_path, n_lines=20):
	'''Predict a file's encoding using chardet'''

	# Open the file as binary data
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
	if delimiter_used is None:
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

	with open(filepath_source,'r', encoding='utf-8', errors='replace') as fi, open(filepath_target, 'w+', encoding='utf-8') as fo:
		text_sample = fi.read(2048)
		fi.seek(0)
		delimiter_used = detect_delimiter(text_sample, filepath_source)
		reader=csv.reader(fi, delimiter=delimiter_used)
		#reader=csv.reader(fi)
		writer = csv.writer(fo, delimiter=',')
		for row in reader:
			writer.writerow(row)

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in filenames:
		#print(os.path.join(dirpath, filename))
		#detected_encoding = predict_encoding(os.path.join(dirpath, filename))
		#encodefile(dirpath, filename, detected_encoding)
		encodefile(dirpath, filename, 'utf-8')
