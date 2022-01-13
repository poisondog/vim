import sys
import os
import re
import json
from javaTool import *

result = []
dictionaryPath = os.environ['HOME'] + "/.vim/dictionary/"
for (dirpath, dirnames, filenames) in os.walk(dictionaryPath):
	for filename in filenames:
		if filename.endswith(".txt"):
			with open(dirpath + "/" + filename) as f:
				lines = f.readlines()
				result.extend(findJavaMethodStart(sys.argv[1], lines))

items = []
for fun in result:
	item = {}
	item['word'] = re.sub(r"\S*(<[^>]*>*)*\s+(\w*)\([^\)]*\)", "\\2", fun)
	item['menu'] = fun
	item['kind'] = 'f'
	items.append(item)
print(json.dumps(items))
