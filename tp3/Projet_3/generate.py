from datetime import datetime
from random import *
import sys

now = datetime.now()

dt_string = now.strftime("%d/%m/%Y %H:%M:%S")


# Filename to write
filename = sys.argv[1]+".dat"
Nm = int(sys.argv[2])
G = int(sys.argv[3])

# Open the file with writing permission
myfile = open(filename, 'w+')

myfile.write("/*********************************************\n")
myfile.write("* OPL 12.8.0.0 Data\n")
myfile.write("* Author: Adrien BLASSIAU Corentin JUVIGNY\n")
myfile.write("* Creation Date: "+dt_string+"\n")
myfile.write("*********************************************/\n")

myfile.write("\n")

# Write a line to the file
myfile.write("N="+str(2*Nm)+";\n")
myfile.write("Nm="+str(Nm)+";\n")
myfile.write("Nf="+str(Nm)+";\n")
myfile.write("C=1;\n")
myfile.write("G="+str(G)+";\n")
myfile.write("A=2;\n")
myfile.write("T=50;\n")
myfile.write("init=0.001;\n")

N=2*Nm
C=1;
G=G;
A=2;

individu = [[[[0 for i in range(0,A)]for j in range(0,G)]for k in range(0,C)]for l in range(0,N)]

print(individu)
for i in range(0,N):
	for j in range (0,C):
		for k in range (0,G):
			for l in range (0,A):
				print(randint(1,3))
				individu[i][j][k][l] = randrange(1,3)

print("toto")
myfile.write("individu="+str(individu)+";\n")

# Close the file
myfile.close()

