#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlrd
from utils import *

confs = open_config('config/source.json')['DATA_SOURCE']
target_folder = confs['TARGET_FOLDER']
converted_folder = confs['CONVERTED_FOLDER']

def convert_xsl(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(target_folder, converted_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	
	workbook = xlrd.open_workbook(filepath_source)
	all_worksheets = workbook.sheet_names()
	worksheet_index = 0
	for worksheet_name in all_worksheets:
		worksheet_index +=1
		all_data = []
		worksheet = workbook.sheet_by_name(worksheet_name)

		prev_row = [None for i in range(worksheet.ncols)]
		for row_index in range(worksheet.nrows):
			row= []
			for col_index in range(worksheet.ncols):
				value = worksheet.cell(rowx=row_index,colx=col_index).value
				if len(str(value)) == 0:
					value = prev_row[col_index]
				row.append(value)
			prev_row = row
			all_data.append(row)

		with open(''.join([filepath_target,'_',str(worksheet_name),'_',str(worksheet_index),'.csv']),'w+') as f:
			for row in all_data:
				dw = csv.writer(f)
				dw.writerow(row)

def convert_ods(dirpath, filename):
	pass

def convert_xmls(dirpath, filename):
	pass