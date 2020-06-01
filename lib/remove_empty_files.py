#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from utils import *

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['CONVERTED_FOLDER']

def remove_empty_files(dirpath, filename):
	dirpath_source = dirpath
	filepath_source  = os.path.join(dirpath, filename)
	if os.stat(filepath_source).st_size == 0:
		os.remove(filepath_source)

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in filenames:
		remove_empty_files(dirpath, filename)