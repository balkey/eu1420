#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
A helper script used to print filepaths to the console, where a possible
header candidate could not be detected.

NOT USED IN THE PRODUCTIONAL PIPELINE!
'''

import os
import sys 
sys.path.insert(0,str(os.getcwd()))

import csv
import itertools
from lib.utils import *

os.environ["PYTHONIOENCODING"] = "utf-8"

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FINAL_FOLDER']

for dirpath, dirnames, filenames in os.walk(source_folder):
	if not dirnames:
		for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
			pre, ext = os.path.splitext(filename)
			with open(os.path.join(dirpath,filename), 'r') as json_file:
				conf_data = json.load(json_file)
				if len(conf_data) == 0:
					print(pre)
				else:
					pass
	else:
		pass