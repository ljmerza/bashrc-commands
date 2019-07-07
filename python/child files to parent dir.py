# flattens a folder tree - all files to cwd


from os.path import join,isdir
from os import listdir, rmdir, path
from shutil import rmtree, move

root = '.'

for foldername in listdir(root):
	if isdir(join(root, foldername)):
		for filename in listdir(join(root, foldername)):
			if 'json' not in filename:
				move( join(root, foldername, filename), join(root, filename))
		rmtree(join(root, foldername))
