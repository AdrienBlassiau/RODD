/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Adrien Blassiau Corentin Juvigny
 * Creation Date: 5 févr. 2020 at 13:18:15
 *********************************************/

int N = ...;
int Nm = ...;
int Nf = ...;
int C = ...;
int G = ...;
int A = ...;
int T = ...;
float init = ...;

range males = 1..Nm;
range femelles = Nm+1..Nm+Nf;
range genes = 1..G;
range paires = 1..C;
range alleles = 1..A;
range population = 1..N;
range approx = 1..T;

int individu[population][paires][genes][alleles] = ...;

float theta[approx];

dvar float z[genes][alleles];
dvar float t[genes][alleles];
dvar int x[population];

execute FillTheta {
	theta[1] = init;
	for (var r in approx) {
		theta[r] = Math.pow(theta[1],(T-r)/(T-1));
	}
}

minimize sum(j in genes, k in alleles) z[j][k];

subject to {
  CrtReproduction:
  	sum(i in males) x[i] == sum(i in femelles) x[i];
  CrtConservation:
  	sum(i in population) x[i] == 2*N;
  CrtNbrEnfantsMax:
  	forall(i in population)
  	  0 <= x[i] <= 2;
  CrtProba1:
  	forall(j in genes, k in alleles)
  	  z[j][k] >= t[j][k] - sum(i in population : individu[i][1][j][1] == individu[i][1][j][2] && individu[i][1][j][1] == k) x[i];
  CrtProba2:
  	forall(r in approx, j in genes, k in alleles)
  	  ln(theta[r]) + (1/theta[r]) * (t[j][k] - theta[r]) >= sum(i in population : individu[i][1][j][1] != individu[i][1][j][2]) x[i] * ln(0.5);
  CrtZNNeg:
  	forall(j in genes, k in alleles)
  	  z[j][k] >= 0;
}

 execute{
 	var total=0
	for(var i in genes){
		for(var j in alleles){
			var somme = 1;
			for(var k in population){
				if(individu[k][1][i][1] == individu[k][1][i][2] && individu[k][1][i][1] == j) {
					somme *= 0;
				}
				else if(individu[k][1][i][1] != individu[k][1][i][2]){
					somme *= Math.pow(0.5, x[k]);
				}
			}
			total+=somme
			writeln(i, ",", j, ": ", somme);
		}
	}
	writeln("total: ", total);
}