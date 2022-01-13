import sys
import os
from javaTool import *

result = []
dictionaryPath = os.environ['HOME'] + "/.vim/dictionary/"
for (dirpath, dirnames, filenames) in os.walk(dictionaryPath):
	for filename in filenames:
		if filename.endswith(".txt"):
			with open(dirpath + "/" + filename) as f:
				lines = f.readlines()
				result.extend(findJavaClassName(sys.argv[1], lines))
print(result)
