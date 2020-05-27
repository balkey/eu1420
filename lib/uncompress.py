import zipfile
import re
import os
import shutil

def extract_nested_zip(zippedFile, toFolder):
	unzipped = []
	'''
		Extract a zip file including any nested zip files
	'''
	with zipfile.ZipFile(zippedFile, 'r') as zfile:
		zfile.extractall(path=toFolder)
		unzipped.append(zippedFile)
	#os.remove(zippedFile)
	for root, dirs, files in os.walk(toFolder):
		for filename in files:
			if re.search(r'\.zip$', filename):
				fileSpec = os.path.join(root, filename)
				if os.path.join(root, filename) not in unzipped:
					extract_nested_zip(fileSpec, toFolder)
			else:
				shutil.move(os.path.join(root, filename), os.path.join(toFolder, filename))
	
	folders = list(os.walk(toFolder))[1:]
	for folder in folders:
		if not folder[2]:
			os.rmdir(folder[0])

for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['zip']]:
		extract_nested_zip(os.path.join(dirpath, filename), dirpath)