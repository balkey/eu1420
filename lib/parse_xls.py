#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlrd
import os
import os.path
import csv

def convert_xsl(filepath):
	all_data = []
	excel = xlrd.open_workbook(filepath)
	sheet_0 = excel.sheet_by_index(0) # Open the first tab

	prev_row = [None for i in range(sheet_0.ncols)]
	for row_index in range(sheet_0.nrows):
		row= []
		for col_index in range(sheet_0.ncols):
			value = sheet_0.cell(rowx=row_index,colx=col_index).value
			if len(str(value)) == 0:
				value = prev_row[col_index]
			row.append(value)
		prev_row = row
		all_data.append(row)

	with open(''.join([filepath,'.csv']),'w+') as f:
		for row in all_data:
			dw = csv.writer(f)
			dw.writerow(row)
alls = 0
successfulls = 0
for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['xls', 'xlsx']]:
		alls += 1
		print(os.path.join(dirpath, filename))
		try:
			convert_xsl(os.path.join(dirpath, filename))
			successfulls +=1
		except Exception as e:
			print(e)

print(alls)
print(successfulls)