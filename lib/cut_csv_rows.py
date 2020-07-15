#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script takes 2 inputs:
	- pheader: an accepted header stored in a list array
	- row_number: an integer

These values need to come from a .json config file.

The script takes the "row_number" argument, and cuts of all
rows before that row, including the row specified.

Then the values of the "pheader argument" are appended to the
first row of the .csv file.

The script does not specify which .csv or json file is its scope.

A source_folder needs to be specified (currently this comes
from a separate configuration file). Then the script walks
through that folder and looks for all .json files. These will be
the config files of the script.

Another prerequisite is that a .csv file needs to reside in the
same folder, with the same name as the .json file, just different
extension.
'''

import csv
import os
import itertools
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

def change_header(filepath, nr_lines, header):
	with open(filepath+'.csv','r') as fi, open(filepath+'_clean.csv','w+') as fo:
		reader = csv.reader(fi)
		writer = csv.writer(fo)
		next(itertools.islice(reader, nr_lines, None))
		writer.writerow(header)
		writer.writerows(reader)

for dirpath, dirnames, filenames in os.walk(source_folder):
	if not dirnames:
		for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
			pre, ext = os.path.splitext(filename)
			with open(os.path.join(dirpath,filename), 'r') as json_file:
				conf_data = json.load(json_file)
				if len(conf_data) > 0:
					nr_of_rows = int(conf_data[0]['row_number'])
					header = conf_data[0]['pheader']
					change_header(os.path.join(dirpath,pre), nr_of_rows, header)
				else:
					pass
	else:
		pass