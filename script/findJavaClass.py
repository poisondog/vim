import sys
import os
from javaTool import *

dictionaryPath = os.environ['HOME'] + "/.vim/dictionary/"
for filename in os.listdir(dictionaryPath):
	result = []
	if filename.endswith(".txt"):
		with open(dictionaryPath + filename) as f:
			lines = f.readlines()
			result.extend(findJavaClassName(sys.argv[1], lines))
print(result)
