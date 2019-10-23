import subprocess
import sys
inputvars=""
for x in sys.argv[1:]:
        inputvars += " %s"%(x)
command = "docker run splunker:latest %s" %(inputvars)

print subprocess.check_output(command, shell=True),