#!/usr/bin/env python
# -*- coding: utf-8 -*-

import gspread
from oauth2client.service_account import ServiceAccountCredentials
import argparse
from utils import *
import os
os.environ["PYTHONIOENCODING"] = "utf-8"

parser = argparse.ArgumentParser(description='Dump to a .csv file from Google worksheets')
parser.add_argument('-k','--api_key', help='Provide a valid API key for Google Drive', required=True)
parser.add_argument('-s','--sheet', help='Provide a source Google Sheet ID', required=True)
parser.add_argument('-w','--worksheet', help='Provide a source Google worksheet name', required=True)
parser.add_argument('-o','--output', help='Provide path for output file', required=True)
args = parser.parse_args()

secret_key = args.api_key

scope = ['https://spreadsheets.google.com/feeds',
		 'https://www.googleapis.com/auth/drive']

credentials = ServiceAccountCredentials.from_json_keyfile_name(secret_key, scope)
number_of_attempts = 5

def write_to_file(data):
	with open(args.output, 'w+', newline='') as f:
		writer = csv.writer(f)
		writer.writerows(data)

def download():
	try:
		qr = gspread.authorize(credentials) \
				.open_by_key(args.sheet) \
				.worksheet(args.worksheet) \
				.get_all_values()
		error_message = None
	except Exception as e:
		error_message = check_error(e)
		pass

	if error_message is None:
		write_to_file(qr)
		print(str(args.output)+' successfully downloaded!')
		return True
	else:
		print('Downloading '+str(args.output)+ ' failed with message: '+error_message)
		return False

if __name__ == '__main__':
	call_api(args.output, number_of_attempts, download, 'downloading')
