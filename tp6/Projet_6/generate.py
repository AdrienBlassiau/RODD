from datetime import datetime
from random import *
import sys

now = datetime.now()

dt_string = now.strftime("%d/%m/%Y %H:%M:%S")


# Filename to write
filename = sys.argv[1]+".dat"
n = m = int(sys.argv[2])

# Open the file with writing permission
myfile = open(filename, 'w+')

myfile.write("/*********************************************\n")
myfile.write("* OPL 12.8.0.0 Data\n")
myfile.write("* Author: Adrien BLASSIAU Corentin JUVIGNY\n")
myfile.write("* Creation Date: "+dt_string+"\n")
myfile.write("*********************************************/\n")

myfile.write("\n")

# Write a line to the file
myfile.write("P=1;\n")
myfile.write("n="+str(n)+";\n")
myfile.write("m="+str(m)+";\n")
myfile.write("w1=1;\n")
myfile.write("w2=5;\n")
myfile.write("L=3;\n")
myfile.write("g=1.26157;\n")

t = [[randrange(60,101) for i in range(0,n)] for j in range(0,m)]

myfile.write("t="+str(t)+";\n")

# Close the file
myfile.close()

