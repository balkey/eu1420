#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import xlrd
import csv
import os
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
import magic
import certifi
import urllib3
from utils import *

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
cafile = certifi.where()

def download_file(url, fileformat, compressed, target_folder):
	params = {'stream':True}
	headers = {'Content-type': 'application/ocsp-request',}
	response = requests.get(url, params=params, verify=False)
	if compressed == '0':
		local_filename = url.split('/')[-1]+'.'+fileformat
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

'''
def define_file_type(url):
	try:
		response = requests.get(url)
		content_type = response.headers['content-type']
		extension = mimetypes.guess_extension(content_type)
	except:
		extension = 'somethings wrong'
	if extension is None:
		extension = 'missing'
	return extension
'''

def main():
	confs = open_config('config/source.json')['DATA_SOURCE']
	filename = confs['FILENAME']
	target_folder = confs['TARGET_FOLDER']
	accepted_columns = confs['ACCEPTED_COLUMNS']
	processed_data = process_sourcefile(filename, accepted_columns)
	for i in processed_data:
		#scaffold(target_folder+'/'+i)
		download_url = processed_data[i][0]
		fileformat = processed_data[i][1]
		compressed = processed_data[i][2]
		access = processed_data[i][3]
		if download_url.strip() != '' and access.strip().lower() == 'online':
			try:
				download_file(download_url, fileformat, compressed, target_folder+'/'+i)
			except Exception as e:
				#TODO: log unsuccessfull download
				print(e)
		else:
			pass
		downloaded_files = os.listdir(target_folder+'/'+i)
		for f in downloaded_files:
			print('-------------------------------')
			try:
				print(target_folder+'/'+i+'/'+f)
				print(magic.from_file(target_folder+'/'+i+'/'+f, mime=True))
			except Exception as inst:
				print(target_folder+'/'+i+'/'+f)
				print(inst)

if __name__ == "__main__":
	main()