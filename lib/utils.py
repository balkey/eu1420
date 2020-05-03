#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json

def check_error(e):
	if e.__class__.__name__ == 'APIError':
		error_message = json.loads(e.response.text)['error']['message']
	else:
		error_message = e.__class__.__name__
	return error_message

def call_api(target, nr_of_tries, function, description, *args):
	calls_attempted = 0
	while calls_attempted < nr_of_tries:
		if function(*args) is False:
			calls_attempted += 1
			if calls_attempted == nr_of_tries:
				raise Exception(str(description)+' '+str(target)+' failed, dataflow stopped!')
		else:
			break
