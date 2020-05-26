#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path
import csv
from converters import *

alls = 0
successfulls = 0
for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames]:
		alls += 1
		extension = filename.split('.')[-1]
		if extension in ['xls', 'xlsx']:
			print(os.path.join(dirpath, filename))
			convert_xsl(dirpath, filename)
		elif extension in ['xml']:
			convert_xml(dirpath, filename)
		elif extension in ['ods']:
			convert_ods(dirpath, filename)
		elif extension in ['zip']:
			print('Bypassing .zip file')
		elif extension in ['csv']:
			print('CSV file needs to be moved')		
		elif extension in ['DS_Store']:
			pass
		else:
			print('WHAT IS THIS? '+str(extension))

print(alls)
print(successfulls)