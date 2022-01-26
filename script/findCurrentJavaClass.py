import re
import sys
from javaTool import *

varname = sys.argv[1]
line = sys.argv[2]
print(findDeclareClass(varname, line))
