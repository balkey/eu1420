#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script controls the converting of source files.
Three different parsers are implemented:
	- xls / xlsx
	- xml
	- ods
The parser scripts are in converters.py
'''

import os
import os.path
import csv
from converters import *

for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames]:
		extension = filename.split('.')[-1]
		if extension not in ['zip', 'DS_Store']:
			if extension in ['xls', 'xlsx']:
				#print(os.path.join(dirpath, filename))
				convert_xsl(dirpath, filename)
				pass
			elif extension in ['xml']:
				convert_xml(dirpath, filename)
				pass
			elif extension in ['ods']:
				convert_ods(dirpath, filename)
			elif extension in ['csv']:
				move_csv(dirpath, filename)
				pass
			else:
				print('WHAT IS THIS? '+str(extension))
				print(dirpath)
				print(filename)