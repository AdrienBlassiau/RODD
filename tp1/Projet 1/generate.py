from datetime import datetime
from random import *
import sys

now = datetime.now()

dt_string = now.strftime("%d/%m/%Y %H:%M:%S")


# Filename to write

filename = sys.argv[1]+".dat"
m = int(sys.argv[2])
n = int(sys.argv[3])
p = int(sys.argv[4])
q = int(sys.argv[5])
e = int(p)+int(q)

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
myfile.write("p="+str(p)+";\n")
myfile.write("q="+str(q)+";\n")

alpha = []

for j in range(0,e):
	alpha.append(random())

myfile.write("alpha="+str(alpha)+";\n\n")

proba = [[[0 for i in range(0,n)]for j in range(0,m)] for k in range(0,e)]

for k in range(0,e):
	for i in range(0,n):
		for j in range (0,m):
			proba[k][i][j] = random()

myfile.write("proba="+str(proba)+";\n\n")


c = [[0 for i in range(0,n)]for j in range(0,m)]


for i in range(0,n):
	for j in range (0,m):
		c[i][j] = randrange(11)

myfile.write("c="+str(c)+";\n")



# Close the file
myfile.close()

