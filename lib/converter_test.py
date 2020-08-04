#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This script controls the converting of source files.
Three different parsers are implemented:
	- xls / xlsx
	- xml
	- ods
The parser scripts are in converters.py
'''

import os
import os.path
import csv
from converters import *

convert_ods('data/source/RO/2014RO', 'PCTE-Lista proiecte contractate Romania-Bulgaria_ian_2018.ods')