#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This is a collection of functions that are general enough to
be reused in the scope of several Python scripts.

The need to be imported at each Python script in the following
manner:

from utils import *
'''

import json
import csv
import os

def check_error(e):
	if e.__class__.__name__ == 'APIError':
		error_message = json.loads(e.response.text)['error']['message']
	else:
		error_message = e.__class__.__name__
	return error_message

def call_api(target, nr_of_tries, function, description, *args):
	calls_attempted = 0
	while calls_attempted < nr_of_tries:
		if function(*args) is False:
			calls_attempted += 1
			if calls_attempted == nr_of_tries:
				raise Exception(str(description)+' '+str(target)+' failed, dataflow stopped!')
		else:
			break

def open_config(config_source):
	with open(config_source) as json_file:
		data = json.load(json_file)
		return data

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
		access_column_name = accepted_columns['ACCESS']
		
		country_column = header.index(country_column_name)
		program_code_column = header.index(program_code_column_name)
		download_url_column = header.index(download_url_column_name)
		file_format_column = header.index(file_format_column_name)
		compressed_column = header.index(compressed_column_name)
		access_column = header.index(access_column_name)
		
		for i in reader:
			programs.setdefault(i[country_column].upper()+'/'+transform_string(i[program_code_column]).upper(),[]).extend([i[download_url_column].strip(), i[file_format_column].strip().lower(), i[compressed_column], i[access_column]])
		return programs

def transform_string(input):
	output = input.lower().strip().replace(' ','_')
	return output

def scaffold(target_folder):
	current_working_dir = os.getcwd()
	if not os.path.exists(current_working_dir+'/'+target_folder):
		os.makedirs(current_working_dir+'/'+target_folder)
