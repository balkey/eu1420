import os
import csv
import json
import itertools
import logging
from functools import wraps
from shutil import copyfile
from utils import *
os.environ["PYTHONIOENCODING"] = "utf-8"

logging.basicConfig(filename='logs/rename_and_copy.log', filemode='w+', format='%(asctime)s - %(message)s')

confs = open_config('config/source.json')['DATA_SOURCE']

source_folder = confs['INPUT_FOLDER']
target_folder = confs['INPUT_TEST']

'''
This script prints the possible header candidates if there's
an ambiguity (more than 1 header candidate is detected),
and through user input prompts to select one final header.
'''

