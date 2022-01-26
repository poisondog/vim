import sys
import os
import re
import json
from javaTool import *

#filepath = sys.argv[1]
#methodstart = sys.argv[2]

methodTarget = sys.argv[1]
#paras = sys.argv[1:]

path = sys.argv[2]
linenumber = sys.argv[3]
paras = []
with open(path) as fp:
	for i, line in reversed(list(enumerate(fp))):
		if i < int(linenumber):
			paras.append(line)

varname = findVariableName(paras[0])
classname = ""
for line in paras:
	classname = findDeclareClass(varname, line)
	if len(classname) > 0:
		break
#print(varname)
#print(classname)

lines = []
filepaths = findClassPath(classname)
#print(filepaths)
for filepath in filepaths:
	with open(filepath) as f:
		lines.extend(findJavaClassMethods(classname, f.readlines()))
result = []
result.extend(findJavaMethodStart(methodTarget, lines))

items = []
for fun in result:
	item = {}
	item['word'] = re.sub(r"\S*(<[^>]*>*)*\s+(\w*)\([^\)]*\)", "\\2", fun)
	item['menu'] = fun
	item['kind'] = 'f'
	items.append(item)
print(json.dumps(items))
