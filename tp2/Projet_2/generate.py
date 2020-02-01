from datetime import datetime
from random import *
import sys

now = datetime.now()

dt_string = now.strftime("%d/%m/%Y %H:%M:%S")


# Filename to write

filename = sys.argv[1]+".dat"
m = int(sys.argv[2])
n = int(sys.argv[3])

# Open the file with writing permission
myfile = open(filename, 'w+')

myfile.write("/*********************************************\n")
myfile.write("* OPL 12.8.0.0 Data\n")
myfile.write("* Author: Adrien BLASSIAU Corentin JUVIGNY\n")
myfile.write("* Creation Date: "+dt_string+"\n")
myfile.write("*********************************************/\n")

myfile.write("\n")

# Write a line to the file
myfile.write("m="+str(m)+";\n")
myfile.write("n="+str(n)+";\n")

Amin = randrange(0.2*m*n,0.8*m*n)
Amax = Amin + randrange(1,11);
B = 10 * randrange(m*n,5*m*n)

myfile.write("B="+str(B)+";\n")
myfile.write("Amin="+str(Amin)+";\n")
myfile.write("Amax="+str(Amax)+";\n")

c = [[0 for i in range(0,n)]for j in range(0,m)]


for i in range(0,n):
	for j in range (0,m):
		c[i][j] = randrange(11)

myfile.write("c="+str(c)+";\n")

myfile.write("lambda=20;\n")

# Close the file
myfile.close()

