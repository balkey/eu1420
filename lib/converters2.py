#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script includes the converter parser scripts.
The functions are called from converter_controler.py
'''

import xlrd
import xlwt
import ezodf
from functools import wraps
import xml.etree.ElementTree
import logging
from shutil import copyfile
from utils import *
import os
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/converted.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['DOWNLOAD_FOLDER']
target_folder = confs['CONVERTED_FOLDER']

def handle_exceptions(fn):
	@wraps(fn)
	def wrapper(*args, **kw):
		try:
			return fn(*args, **kw)
		except Exception as e:
            #exception_handler(self.log)
			#print(e)
			logging.error('Error occurred with '+str(os.path.join(args[0], args[1]))+' Message: '+str(e), exc_info=False)
	return wrapper


def convert_unicode_to_utf8(value):
	if isinstance(value, str):
		value = value.encode('utf8')
	return value

@handle_exceptions
def unmerge_xsl(dirpath, filename):
	#TODO: Follow here: https://github.com/zanran/unMergeExcelCell/blob/master/unMergeExcelCell.py
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	
	workbook = xlrd.open_workbook(filepath_source)
	all_worksheets = workbook.sheet_names()
	worksheet_index = 0
	
	excel = xlwt.Workbook()
	merged_log = {}
	nonmerged_log = {}
	
	for worksheet_name in all_worksheets:
		worksheet_index +=1
		all_data = []
		rd_sheet = workbook.sheet_by_name(worksheet_name)
		wt_sheet = excel.add_sheet(rd_sheet.name)
		writed_cells = []
		
		# overwrite for merged cells
		for crange in rd_sheet.merged_cells:
			rlo, rhi, clo, chi = crange
			cell_value = rd_sheet.cell(rlo, clo).value
			for rowx in range(rlo, rhi):
				column_counter = 0
				for colx in range(clo, chi):
					wt_sheet.write(rowx, colx, cell_value)
					writed_cells.append((rowx, colx))
					column_counter +=1
				merged_log[str(rowx)] = (column_counter,clo,chi)

		# write all un-merged cells
		for r in range(0, rd_sheet.nrows):
			for c in range(0, rd_sheet.ncols):
				if (r, c) in writed_cells:
					continue
				cell_value = rd_sheet.cell(r, c).value
				wt_sheet.write(r, c, cell_value)
				nonmerged_log[str(r)] = 0
		
	#final_log = {**merged_log, **nonmerged_log}
	final_log = merged_log
	unmerge_excel_file = ''.join([filepath_target,'_umerged','.xls'])
	excel.save(unmerge_excel_file)
	for k, v in sorted(final_log.items(), key=lambda x: int(x[0])):
		print(str(k)+' '+str(final_log[k]))

@handle_exceptions
def convert_xsl(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	filepath_unmerged = ''.join([filepath_target,'_umerged','.xls'])
	
	workbook = xlrd.open_workbook(filepath_unmerged)
	all_worksheets = workbook.sheet_names()
	worksheet_index = 0

	for worksheet_name in all_worksheets:
		worksheet = workbook.sheet_by_name(worksheet_name)
		worksheet_index +=1
		all_data = []

		for row_index in range(worksheet.nrows):
			row= []
			for col_index in range(worksheet.ncols):
				value = str(worksheet.cell(rowx=row_index,colx=col_index).value)
				value =	value.replace('\n', ' ').replace('\r', ' ')
				row.append(value)
			all_data.append(row)

		with open(''.join([filepath_target,'_',str(worksheet_index),'_',str(worksheet_name),'.csv']),'w+') as f:
			dw = csv.writer(f, delimiter=',')
			for row in all_data:
				dw.writerow(row)

@handle_exceptions
def convert_xml(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)

	e = xml.etree.ElementTree.parse(filepath_source).getroot()

	container_counter = 0
	tables_counter=0
	table_counter = 0

	for container in e:
		container_counter +=1
		for tables in container:
			tables_counter +=1
			for table in tables:
				table_counter +=1
				with open(''.join([filepath_target,'_',str(container_counter),'_',str(tables_counter),'_',str(table_counter),'.csv']),'w+') as f:
					dw = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
					for row in table:
						rows_out = []
						for cells in row:
							for cell in cells:
								for value in cell:
									#rows_out.append(convert_unicode_to_utf8(value.text))
									rows_out.append(str(value.text))
						dw.writerow(rows_out)

@handle_exceptions
def convert_ods(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	workbook = ezodf.opendoc(filepath_source)
	worksheet_index = 0
	for worksheet in workbook.sheets:
		worksheet_name = worksheet.name
		worksheet_index +=1
		all_data = []
		prev_row = [None for i in range(worksheet.ncols())]
		for row_index in range(worksheet.nrows()):
			row= []
			for col_index in range(worksheet.ncols()):
				#value = convert_unicode_to_utf8(str(worksheet[(row_index,col_index)].value))
				value = str(worksheet[(row_index,col_index)].value)			
				if value is not None and value != 'None':
					value = value.replace('\n', ' ').replace('\r', ' ')
				else:
					if prev_row[col_index] is not None and prev_row[col_index] != 'None':
						value = str(prev_row[col_index]).replace('\n', ' ').replace('\r', ' ')
					else:
						value = ''
					#TODO: HERE THIS MIGHT NEED TO BE REVISED,
					#SO MERGED CELLS ARE UNMERGED ON X AND Y AXIS AS WELL!
					#if len(str(value)) == 0:
						#value = prev_row[col_index-1]
				row.append(value)
			prev_row = row
			all_data.append(row)

		with open(''.join([filepath_target,'_',str(worksheet_index),'_',str(worksheet_name),'.csv']),'w+') as f:
			dw = csv.writer(f, delimiter=',')
			for row in all_data:
				dw.writerow(row)

@handle_exceptions
def move_csv(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)

	dirpath_target = dirpath.replace(source_folder, target_folder)
	filepath_target = os.path.join(dirpath_target, filename)
	copyfile(filepath_source, filepath_target)