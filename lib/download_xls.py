#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlrd
import csv
from os import sys
import requests


'''
ARGUMENTS NEED TO BE PROVIDED...
'''

def download_file(url, target_folder):
	params = {'stream':True}
	response = requests.get(url, params=params)
	local_filename = target_folder+url.split('/')[-1]
	totalbits = 0
	if response.status_code == 200:
		with open(local_filename, 'wb') as f:
			for chunk in response.iter_content(chunk_size=1024):
				if chunk:
					totalbits += 1024
					print("Downloaded",round(totalbits/1025,2),"KB...")
					f.write(chunk)

def csv_from_excel(excel_file, target_folder):
	workbook = xlrd.open_workbook(excel_file)
	all_worksheets = workbook.sheet_names()
	for worksheet_name in all_worksheets:
		worksheet = workbook.sheet_by_name(worksheet_name)
		with open(u'{}.csv'.format(target_folder+worksheet_name), 'w+') as your_csv_file:
			wr = csv.writer(your_csv_file, quoting=csv.QUOTE_ALL)
			for rownum in range(worksheet.nrows):
				wr.writerow([entry.encode("utf-8") for entry in worksheet.row_values(rownum)])

def main(argument):
	target_folder = 'data/source/'
	local_filename = target_folder+argument.split('/')[-1]
	download_file(sys.argv[1], target_folder)
	csv_from_excel(local_filename, target_folder)

if __name__ == "__main__":
	main(sys.argv[1])