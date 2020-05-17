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

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
cafile = certifi.where()

def open_config(config_source):
	with open(config_source) as json_file:
		data = json.load(json_file)
		return data

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

def csv_from_excel(excel_file, target_folder):
	workbook = xlrd.open_workbook(excel_file)
	all_worksheets = workbook.sheet_names()
	for worksheet_name in all_worksheets:
		worksheet = workbook.sheet_by_name(worksheet_name)
		with open(u'{}.csv'.format(target_folder+worksheet_name), 'w', encoding='utf8') as your_csv_file:
			wr = csv.writer(your_csv_file, quoting=csv.QUOTE_ALL)
			for rownum in range(worksheet.nrows):
				wr.writerow([entry for entry in worksheet.row_values(rownum)])

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

def process_sourcefile(csv_file, accepted_columns):
	with open(csv_file, 'r') as i:
		programs = {}
		reader = csv.reader(i)
		header = next(reader)
		
		country_column_name = accepted_columns['REGION']
		program_code_column_name = accepted_columns['PROGRAM_CODE']
		download_url_column_name = accepted_columns['ENDPOINT']
		file_format_column_name = accepted_columns['FILEFORMAT']
		compressed_column_name = accepted_columns['COMPRESSED']
		
		country_column = header.index(country_column_name)
		program_code_column = header.index(program_code_column_name)
		download_url_column = header.index(download_url_column_name)
		file_format_column = header.index(file_format_column_name)
		compressed_column = header.index(compressed_column_name)
		
		for i in reader:
			programs.setdefault(i[country_column].upper()+'/'+transform_string(i[program_code_column]).upper(),[]).extend([i[download_url_column].strip(), i[file_format_column].strip().lower(), i[compressed_column]])
		return programs

def scaffold(target_folder):
	current_working_dir = os.getcwd()
	if not os.path.exists(current_working_dir+'/'+target_folder):
		os.makedirs(current_working_dir+'/'+target_folder)

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
	confs = open_config('config/source2.json')['DATA_SOURCE']
	filename = confs['FILENAME']
	target_folder = confs['TARGET_FOLDER']
	accepted_columns = confs['ACCEPTED_COLUMNS']
	processed_data = process_sourcefile(filename, accepted_columns)
	for i in processed_data:
		scaffold(target_folder+'/'+i)
		download_url = processed_data[i][0]
		fileformat = processed_data[i][1]
		compressed = processed_data[i][2]
		if download_url.strip() != '':
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