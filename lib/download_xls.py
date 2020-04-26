#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import xlrd
import csv
import os
import requests
import mimetypes

def open_config(config_source):
	with open(config_source) as json_file:
		data = json.load(json_file)
		return data

def download_file(url, target_folder):
	params = {'stream':True}
	response = requests.get(url, params=params)
	local_filename = target_folder+url.split('/')[-1]
	totalbits = 0
	if response.status_code == 200:
		with open(local_filename, 'wb') as f:
			for chunk in response.iter_content(chunk_size=1024):
				if chunk:
					totalbits += 1024
					print("Downloaded",round(totalbits/1025,2), "KB...")
					f.write(chunk)

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
		countries = []
		urls = []
		reader = csv.reader(i)
		header = next(reader)
		country_column_name = accepted_columns['REGION']
		download_url_column_name = accepted_columns['PROGRAM_FILE_SOURCE']
		country_column = header.index(country_column_name)
		download_url_column = header.index(download_url_column_name)
		for i in reader:
			countries.append(transform_string(i[country_column]).upper())
			urls.append(i[download_url_column].strip())
		countries_final = sorted([i for i in set(countries) if i != ''])
		return [countries_final, urls]

def scaffold(target_folder, list_of_names):
	current_working_dir = os.getcwd()
	for i in list_of_names:
		if not os.path.exists(current_working_dir+'/'+target_folder+'/'+i):
			os.makedirs(current_working_dir+'/'+target_folder+'/'+i)

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

def main():
	confs = open_config('config/source.json')['DATA_SOURCE']
	url = confs['URL']
	target_folder = confs['TARGET_FOLDER']
	local_filename = target_folder+url.split('/')[-1]
	csv_source =  confs['TABNAME']+'.csv'
	accepted_columns = confs['ACCEPTED_COLUMNS']
	#download_file(url, target_folder)
	#csv_from_excel(local_filename, target_folder)
	#validate_sourcefile(target_folder+csv_source, accepted_columns)
	processed_data = process_sourcefile(target_folder+csv_source[:-4]+'_clean.csv', accepted_columns)
	scaffold(target_folder,processed_data[0])
	scaffold('script',processed_data[0])
	for i in processed_data[1]:
		if i is not None:
			print(i+' '+define_file_type(i))
		else:
			pass


if __name__ == "__main__":
	main()