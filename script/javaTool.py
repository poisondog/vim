import re
import sys

def findJavaClassName(simpleClass, lines):
	"""docstring for findJavaClassName"""
	result = []
	regex = r"^public\s(final\s)*(class|interface)\s(\S*" + simpleClass + ")(<[^>]*>*)*\s(extends\s([\.\w]*)(<[^>]*>*)*\s)*(implements\s(.*)\s)*{"
	for line in lines:
		matches = re.finditer(regex, line, re.MULTILINE)
		for matchNum, match in enumerate(matches, start=1):
			result.add(match.group(2))
	return result
