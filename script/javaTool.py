import re
import os
import subprocess

classPatten = r"^\s*public\s+(final\s+)*(class|interface)\s+(\S*<classname>)(<[^>]*>*)*\s*(extends\s+([\.\w]*)(<[^>]*>*)*\s*)*(implements\s+(.*)\s*)*{"
methodPatten = r"^\s*(public|protected|private)\s+(static\s+)*(final\s+)*(native\s+)*(abstract\s+)*((\S*)\s+(<method>\S*)\([^\)]*\))"
declarePatten = r"\s*(private|protected|public)*\s*(static\s+)*(final\s+)*([\w<>?]+)\s+<var>\s*=*.*"
variablePatten = r"\s*=*\s*(\w+)\.\w*"

def isJavaClassName(simpleClass, line):
	"""docstring for isJavaClassName"""
	regex = re.sub("<classname>", "\." + simpleClass, classPatten)
	matches = re.finditer(regex, line, re.MULTILINE)
	for matchNum, match in enumerate(matches, start=1):
		return True
	return False

def findJavaClassName(simpleClass, lines):
	"""docstring for findJavaClassName"""
	result = []
	regex = re.sub("<classname>", "\." + simpleClass, classPatten)
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

def findDeclareClass(var, line):
	"""docstring for findDeclareClass"""
	regex = re.sub("<var>", var, declarePatten)
	matches = re.finditer(regex, line, re.MULTILINE)
	for matchNum, match in enumerate(matches, start=1):
		return match.group(4)
	return ""

def findVariableName(line):
	"""docstring for findVarname"""
	matches = re.finditer(variablePatten, line, re.MULTILINE)
	for matchNum, match in enumerate(matches, start=1):
		return match.group(1)
	return ""

def findJavaMethodStart(method, lines):
	"""docstring for findMethods"""
	result = []
	if len(method) == 0:
		method = "\w+"
	regex = re.sub("<method>", method, methodPatten)
	for line in lines:
		matches = re.finditer(regex, line, re.MULTILINE)
		for matchNum, match in enumerate(matches, start=1):
			result.append(match.group(6))
	return result

def findClassPath(simpleclassname):
	"""docstring for findClassPath"""
#	command = []
#	command.append("grep")
#	command.append("-r")
#	command.append("\"[^a-zA-Z0-9]" + simpleclassname + ".java\"")
#	command.append("~/.vim/dictionary.index")
#	command.append("|")
#	command.append("awk")
#	command.append("-F':'")
#	command.append("'{print $1}'")
#	command.append("|")
#	command.append("uniq")
#	print(command)
#	result = subprocess.run(command)
#	print(os.system("grep -r \"[^a-zA-Z0-9]" + simpleclassname + ".java\" ~/.vim/dictionary.index | awk -F':' '{print $1}' | uniq"))
#	print(os.popen("grep -r \"[^a-zA-Z0-9]" + simpleclassname + ".java\" ~/.vim/dictionary.index | awk -F':' '{print $1}' | uniq").read())
	return os.popen("grep -r \"[^a-zA-Z0-9]" + simpleclassname + ".java\" ~/.vim/dictionary.index | awk -F':' '{print $1}' | uniq").read().split('\n')[0:-1]
