#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
The script creates subfolders under a folderpath specified as an argument.
The structure of the folders created need to come from a .csv file that
contains the following columns:
	- REGION: region code of the file
	- PROGRAM_CODE: program code / CCI / identifier the file belongs to
	- ENDPOINT: a http address where the file is located at
	- COMPRESSED: boolean if the file is compressed
	- ACCESS: value "online" controls, if the file is expected to be accessible
		Rows with other values will be discarded.
'''
from utils import *
import argparse

parser = argparse.ArgumentParser(description='Create a folder structure following data model')
parser.add_argument('-s','--subfolder', help='Provide a subfolder to scaffold', required=True)
args = parser.parse_args()

subfolder_scope = args.subfolder

confs = open_config('config/source.json')['DATA_SOURCE']
filename = confs['FILENAME']
target_folder = confs[subfolder_scope]
accepted_columns = confs['ACCEPTED_COLUMNS']
processed_data = process_sourcefile(filename, accepted_columns)
for i in processed_data:
	scaffold(target_folder+'/'+i)