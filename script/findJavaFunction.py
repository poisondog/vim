import re
import sys

regex = r"^\s*(private|public|protected).*\s(\S+)\s*\(.*\).*{\s*$"

for line in sys.argv:
	matches = re.finditer(regex, line, re.MULTILINE)
	for matchNum, match in enumerate(matches, start=1):
		print(match.group(2))
