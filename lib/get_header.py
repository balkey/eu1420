#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import csv
import itertools


def get_header(filepath):
	with open(filepath, 'r+') as f:
		reader = csv.reader(f)
		dicto = []
		max_length = 0
		for i, row in enumerate(reader):
			row_length = len([i for i in row if str(i).strip() != ''])
			if row_length > max_length:
				dicto.append(i)
				max_length = row_length
	
	if len(dicto) > 0:
		for i in dicto:
			with open(filepath, 'r+') as ff:
				print(i)
				print(next(itertools.islice(csv.reader(ff), i, None)))
		
	

for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['csv']]:
		print(os.path.join(dirpath, filename))
		try:
			get_header(os.path.join(dirpath, filename))
		except Exception as e:
			print("Error")
			print(e)