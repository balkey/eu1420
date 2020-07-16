#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This scripts dumps a valid .csv file to a Google Sheet via the API.
'''

import gspread
from oauth2client.service_account import ServiceAccountCredentials
import csv
import pandas as pd
import argparse
from utils import *


parser = argparse.ArgumentParser(description='Dump .csv file to Google worksheets')
parser.add_argument('-i','--input', help='Provide an inputfile', required=True)
parser.add_argument('-s','--targetsheet', help='Provide a target Google Sheet ID', required=True)
parser.add_argument('-w','--targetworksheet', help='Provide a target Google worksheet name', required=True)
args = parser.parse_args()

inputfile = args.input
sheet_id = args.targetsheet
worksheet_id = args.targetworksheet
number_of_attempts = 5
target = str(worksheet_id)+' at '+str(sheet_id)

secret_key = 'config/client_secret.json'

scope = ['https://spreadsheets.google.com/feeds',
		 'https://www.googleapis.com/auth/drive']

credentials = ServiceAccountCredentials.from_json_keyfile_name(secret_key, scope)

def open_csv(inputfile):
	df = pd.read_csv(inputfile, low_memory=False)
	df = df.fillna("")
	df = df.replace('\n',"")
	return df

def create_cells(data, header):
	cells = []
	for column in header:
		cells.append(gspread.Cell(1, header.index(column)+1, column))

	for row_num, row in enumerate(data):
		for col_num, cell in enumerate(row):
			if str(data[row_num][col_num]).lower() == 'true' or str(data[row_num][col_num]).lower() == 'false':
				cells.append(gspread.Cell(row_num + 2, col_num + 1, str(data[row_num][col_num]).lower()))
			else:
				cells.append(gspread.Cell(row_num + 2, col_num + 1, str(data[row_num][col_num])))
				#TODO: Formating of integers is sketchy: if there's a row with NULL value, integers become decimals.
				#cells.append(gspread.Cell(row_num + 2, col_num + 1, gspread.numericise(str(df[row_num][col_num]))))
	return cells

def dump_to_worksheet(credentials, sheet_id, worksheet_id):
	try:
		worksheet = gspread.authorize(credentials) \
						   .open_by_key(sheet_id) \
						   .worksheet(worksheet_id)

		worksheet.clear()
		#update_res = service.update_spreadsheet_value(spreadsheet_id, range, value_range_object, value_input_option: 'USER_ENTERED')
		error_message = None
	except Exception as e:
		error_message = check_error(e)
		pass
	
	if error_message is None:
		data = open_csv(inputfile)
		header = list(data)
		data = data.values.tolist()
		cells = create_cells(data, header)
		try:
			worksheet.update_cells(cells)
			print(target+' successfully updated!')
			return True

		except Exception as e:
			error_message = check_error(e)
			print('Dumping to '+target+ ' failed with message: '+error_message)
			return False
	else:
		print('Accessing '+target+ ' failed with message: '+error_message)
		return False

if __name__ == '__main__':
	call_api(target, number_of_attempts, dump_to_worksheet, 'Dumping to', credentials, sheet_id, worksheet_id)
