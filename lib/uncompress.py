import os
import zipfile

for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames if f.split('.')[-1] in ['zip']]:
		print(os.path.join(dirpath, filename))
		with zipfile.ZipFile(os.path.join(dirpath, filename), 'r') as zip_ref:
			zip_ref.extractall(dirpath)
			#TODO: Do the logging of successfull unzip here!