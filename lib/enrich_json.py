#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from shutil import copyfile
import logging
import json
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/enrich_json.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']
source_folder = confs['INPUT_FOLDER']

for dirpath, dirnames, filenames in os.walk(source_folder):
	for filename in [f for f in filenames if f.split('.')[-1] in ['json']]:
		
