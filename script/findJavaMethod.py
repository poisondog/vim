import sys
import os
from javaTool import *

result = []
dictionaryPath = os.environ['HOME'] + "/.vim/dictionary/"
for filename in os.listdir(dictionaryPath):
	if filename.endswith(".txt"):
		with open(dictionaryPath + filename) as f:
			lines = f.readlines()
			result.extend(findJavaMethodStart(sys.argv[1], lines))
for fun in result:
	print(fun)
