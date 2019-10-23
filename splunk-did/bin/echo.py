import subprocess
import sys

print "lul"
print sys.argv[1]
print subprocess.check_output(sys.argv[1], shell=True),