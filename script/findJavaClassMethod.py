import sys
import os
import re
import json
from javaTool import *

methodTarget = sys.argv[1]
path = sys.argv[2]
linenumber = sys.argv[3]

# 取得輸入檔案及行號前的每一行
lines = []
with open(path) as fp:
	for i, line in reversed(list(enumerate(fp))):
		if i < int(linenumber):
			lines.append(line)

# 搜尋變數對應的類別名稱
classname = ""
for line in lines:
	classname = findDeclareClass(findVariableName(lines[0]), line)
	if len(classname) > 0:
		break

# 搜尋符合 simple class name 的所有 method
methods = []
for filepath in findClassPath(classname):
	with open(filepath) as f:
		methods.extend(findJavaClassMethods(classname, f.readlines()))

# 搜尋符合 methodTarget 的 method 並轉換成 json 輸出
items = []
for fun in findJavaMethodStart(methodTarget, methods):
	item = {}
	item['word'] = re.sub(r"\S*(<[^>]*>*)*\s+(\w*)\([^\)]*\)", "\\2", fun)
	item['menu'] = fun
	item['kind'] = 'f'
	items.append(item)
print(json.dumps(items))
