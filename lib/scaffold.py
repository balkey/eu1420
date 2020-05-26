#!/usr/bin/env python
# -*- coding: utf-8 -*-

from utils import *

confs = open_config('config/source.json')['DATA_SOURCE']
filename = confs['FILENAME']
target_folder = confs['TARGET_FOLDER']
converted_folder = confs['CONVERTED_FOLDER']
encoded_folder = confs['ENCODED_FOLDER']
input_folder = confs['INPUT_FOLDER']
accepted_columns = confs['ACCEPTED_COLUMNS']
processed_data = process_sourcefile(filename, accepted_columns)
for i in processed_data:
	scaffold(target_folder+'/'+i)
	scaffold(converted_folder+'/'+i)
	scaffold(encoded_folder+'/'+i)
	scaffold(input_folder+'/'+i)