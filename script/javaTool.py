import re

def isJavaClassName(simpleClass, line):
	"""docstring for isJavaClassName"""
	regex = r"^public\s(final\s)*(class|interface)\s(\S*\." + simpleClass + ")(<[^>]*>*)*\s(extends\s([\.\w]*)(<[^>]*>*)*\s)*(implements\s(.*)\s)*{"
	matches = re.finditer(regex, line, re.MULTILINE)
	for matchNum, match in enumerate(matches, start=1):
		return True
	return False

def findJavaClassName(simpleClass, lines):
	"""docstring for findJavaClassName"""
	result = []
	regex = r"^public\s(final\s)*(class|interface)\s(\S*\." + simpleClass + ")(<[^>]*>*)*\s(extends\s([\.\w]*)(<[^>]*>*)*\s)*(implements\s(.*)\s)*{"
	for line in lines:
		matches = re.finditer(regex, line, re.MULTILINE)
		for matchNum, match in enumerate(matches, start=1):
			result.append(match.group(3))
	return result

def containsWords(line, words):
	"""docstring for contains"""
	for word in words:
		if word in line:
			return True
	return False

def findJavaClassMethods(simpleClass, lines):
	"""docstring for findMethods"""
	flag = False
	result = []
	endPatten = r"^}$"
	for line in lines:
		if flag:
			result.append(re.sub(r'\n$', '', re.sub(r'^\s*', '', line)))
		if isJavaClassName(simpleClass, line):
			flag = True
		matches = re.finditer(endPatten, line, re.MULTILINE)
		for matchNum, match in enumerate(matches, start=1):
			flag = False
	return result[0:-1]

def findJavaMethodStart(method, lines):
	"""docstring for findMethods"""
	result = []
	regex = r"^\s\s(public|protected|private)\s(static\s)*(final\s)*((\S*)\s(" + method + "\S*)\([^\)]*\))"
	for line in lines:
		matches = re.finditer(regex, line, re.MULTILINE)
		for matchNum, match in enumerate(matches, start=1):
			result.append(match.group(4))
	return result
