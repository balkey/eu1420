#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
from functools import wraps
import xlrd
import csv
import os
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
import magic
import certifi
import logging
import urllib3
from utils import *

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
cafile = certifi.where()

logging.basicConfig(filename='logs/downloaded.log', filemode='w+', format='%(asctime)s - %(message)s')

def handle_exceptions(fn):
	@wraps(fn)
	def wrapper(*args, **kw):
		try:
			return fn(*args, **kw)
		except Exception as e:
            #exception_handler(self.log)
			#print(e)
			logging.error('Error occurred with downloading file from '+str(args[0])+' to folder'+str(args[3])+' with fileformat: '+str(args[1])+'. Message: '+str(e), exc_info=False)
	return wrapper

@handle_exceptions
def download_file(url, fileformat, compressed, target_folder):
	params = {'stream':True}
	headers = {'Content-type': 'application/ocsp-request',}
	response = requests.get(url, params=params, verify=False)
	if compressed == '0':
		local_filename = url.split('/')[-1]+'.'+fileformat
	else:
		if url.split('.')[-1] in ['zip']:
			local_filename = url.split('/')[-1]
		else:
			local_filename = url.split('/')[-1]+'.zip'
	totalbits = 0
	if response.status_code == 200:
		with open(target_folder+'/'+local_filename, 'wb') as f:
			for chunk in response.iter_content(chunk_size=1024):
				if chunk:
					totalbits += 1024
					#print("Downloaded",round(totalbits/1025,2), "KB...")
					f.write(chunk)
		return local_filename

def transform_string(input):
	output = input.lower().strip().replace(' ','_')
	return output

def validate_sourcefile(csv_file, columns):
	with open(csv_file, 'r') as i, open(csv_file[:-4]+'_clean.csv', 'w+') as o:
		reader = csv.reader(i)
		writer = csv.writer(o)
		header = next(reader)
		accepted_columns = set([columns[k] for k in columns])
		valid_header = [transform_string(i) for i in header if transform_string(i) in accepted_columns] 
		to_download = [header.index(i) for i in header if transform_string(i) in accepted_columns]
		writer.writerow(valid_header)
		for row in reader:
			writer.writerow([row[i] for i in to_download])

def define_file_type(filepath):
	print(filepath)
	try:
		print(magic.from_file(filepath, mime=True))
	except Exception as inst:
		print(inst)

def main():
	confs = open_config('config/source.json')['DATA_SOURCE']
	filename = confs['FILENAME']
	target_folder = confs['DOWNLOAD_FOLDER']
	accepted_columns = confs['ACCEPTED_COLUMNS']
	processed_data = process_sourcefile(filename, accepted_columns)
	for i in processed_data:
		#scaffold(target_folder+'/'+i)
		download_url = processed_data[i][0]
		fileformat = processed_data[i][1]
		compressed = processed_data[i][2]
		access = processed_data[i][3]
		if download_url.strip() != '' and access.strip().lower() == 'online':
			download_file(download_url, fileformat, compressed, target_folder+'/'+i)
		else:
			pass
		#downloaded_files = os.listdir(target_folder+'/'+i)
		#for f in downloaded_files:
			#define_file_type(target_folder+'/'+i+'/'+f)

if __name__ == "__main__":
	main()