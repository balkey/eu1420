#!/usr/bin/env python
# -*- coding: utf-8 -*-

from utils import *
import argparse


parser = argparse.ArgumentParser(description='Create a folder structure following data model')
parser.add_argument('-s','--subfolder', help='Provide a subfolder to scaffold', required=True)
args = parser.parse_args()

subfolder_scope = args.subfolder

confs = open_config('config/source.json')['DATA_SOURCE']
filename = confs['FILENAME']
target_folder = confs[subfolder_scope]
accepted_columns = confs['ACCEPTED_COLUMNS']
processed_data = process_sourcefile(filename, accepted_columns)
for i in processed_data:
	scaffold(target_folder+'/'+i)