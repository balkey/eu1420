import os
import csv
import json
import itertools
import logging
from functools import wraps
from shutil import copyfile
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/rename_and_copy.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']

source_folder = confs['INPUT_FOLDER']
target_folder = confs['INPUT_EVAL_FOLDER']

'''
This script prints the possible header candidates if there's
an ambiguity (more than 1 header candidate is detected),
and through user input prompts to select one final header.
'''

def clear_cls():
    os.system('cls' if os.name=='nt' else 'clear')

def get_user_input(prompt, values):
	while True:
		value = str((input(prompt)).strip())
		if value in values or value.lower() == 'c':
			break
		else:
			clear_cls()
			print('Sorry, your choice must be one of the following values \n'+','.join(values)+'\nor "c" for not assigning a header at all\n')
			continue
	return value

def make_copy(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	copyfile(filepath_source,filepath_target)	

def evaluate_header(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	with open(filepath_source) as json_file:
		try:
			data = json.load(json_file)
		except:
			data = []
		if len(data) == 0:
			response = []
		elif len(data) == 1:
			response = data
		else:
			print(json.dumps(data, indent=4, ensure_ascii=False))
			candidate_rows = []
			for i in data:
				candidate_rows.append(str(i['row_number']))
			print(dirpath_source.split('/')[-1])
			user_choice = get_user_input('Enter a row_number for possible candidate!\nPossible values: '+','.join(candidate_rows)+'\nor "c" for not assigning a header at all\n', candidate_rows)
			clear_cls()
			if user_choice in candidate_rows:
				response = [i for i in data if i['row_number'] == int(user_choice)]
			else:
				response = []

		with open(filepath_target, 'w+') as fo:
			json.dump(response, fo, indent=4, sort_keys=True, ensure_ascii=False)
		
for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in filenames:
		extension = filename.split('.')[-1]
		if extension in ['json']:
			evaluate_header(dirpath, filename)
		elif extension in ['csv']:
			make_copy(dirpath, filename)