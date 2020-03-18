from datetime import datetime
from random import *
import sys

now = datetime.now()

dt_string = now.strftime("%d/%m/%Y %H:%M:%S")


# Filename to write
filename = sys.argv[1]+".dat"
# n = m = int(sys.argv[2])

# Open the file with writing permission
myfile = open(filename, 'w+')

myfile.write("/*********************************************\n")
myfile.write("* OPL 12.8.0.0 Data\n")
myfile.write("* Author: Adrien BLASSIAU Corentin JUVIGNY\n")
myfile.write("* Creation Date: "+dt_string+"\n")
myfile.write("*********************************************/\n")

myfile.write("\n")

T = 12
M = 4
Emax = [3,3,3,3,3,3,3,3,3,3,3,3]
R=6
dmin = 20
dmax = 70
f = [[10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90],
	 [10,30,60,90]]
e=[[8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2],
   [8,6,4,2]];
h=[1,1,1,1,1,1,1,1,1,1,1,1];
p=[[0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0],
   [0,0,0,0]];

d = [randrange(dmin,dmax) for i in range(0,T)]

# Write a line to the file
myfile.write("T="+str(T)+";\n")
myfile.write("M="+str(M)+";\n")
myfile.write("R="+str(R)+";\n")
myfile.write("Emax="+str(Emax)+";\n")
myfile.write("f="+str(f)+";\n")
myfile.write("e="+str(e)+";\n")
myfile.write("h="+str(h)+";\n")
myfile.write("p="+str(p)+";\n")
myfile.write("d="+str(d)+";\n")

# Close the file
myfile.close()

