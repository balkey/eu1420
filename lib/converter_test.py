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
from converters2 import *

unmerge_xsl('data/source/PT/2014PT16M2OP007', '20200414_quadro_ii_operacoes_aprovadas_31-03-2020.xlsx.xlsx')
#convert_xsl('data/source/PT/2014PT16M2OP007', '20200414_quadro_ii_operacoes_aprovadas_31-03-2020.xlsx.xlsx')