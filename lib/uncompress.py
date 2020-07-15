#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
The script unzpis a compressed file if it's extension equals to "zip".
The internal folder structure of the compressed file is discarded
from the output, only the files at the lowest level of the structure are
kept.
'''

import zipfile
import re
import os
import shutil
import logging
from functools import wraps

logging.basicConfig(filename='logs/uncompressed.log', filemode='w+', format='%(asctime)s - %(message)s')

def handle_exceptions(fn):
	@wraps(fn)
	def wrapper(*args, **kw):
		try:
			return fn(*args, **kw)
		except Exception as e:
			logging.error('Error occurred with uncompressing file '+str(args[0])+' to folder'+str(args[1])+'. Message: '+str(e), exc_info=False)
	return wrapper

@handle_exceptions
def extract_nested_zip(zipped_file, target_folder):
	unzipped = []
	with zipfile.ZipFile(zipped_file, 'r') as zfile:
		zfile.extractall(path=target_folder)
		unzipped.append(zipped_file)
	for root, dirs, files in os.walk(target_folder):
		for filename in files:
			if filename[0] == '.':
				os.remove(os.path.join(root, filename))				
			elif filename.split('.')[-1] in ['zip']:
				file_spec = os.path.join(root, filename)
				if os.path.join(root, filename) not in unzipped:
					extract_nested_zip(file_spec, target_folder)
			else:
				shutil.move(os.path.join(root, filename), os.path.join(target_folder, filename))
	
	folders = list(os.walk(target_folder))[1:]
	for folder in folders:
		if not folder[2]:
			os.rmdir(folder[0])

for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['zip']]:
		extract_nested_zip(os.path.join(dirpath, filename), dirpath)