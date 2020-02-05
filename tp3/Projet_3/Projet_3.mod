/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Adrien
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
range humains = 1..N;
range approx = 1..T;

int individu[humains][paires][genes][alleles] = ...;
float disparition[humains][genes];

float theta[approx];

dvar float z[genes][alleles];
dvar int x[humains];
dvar float t[genes][alleles];

execute FillDisparition {
	for (var i in humains) {
		for (var j in genes) {
			var diff = individu[i][1][j][1] + individu[i][1][j][2] - 3;
			if (diff > 0) {
				disparition[i][j] = 1;
				disparition[i][j][2] = 0;
  			}
  			else if (diff < 0) {
  				disparition[i][j][1] = 0;
  				disparition[i][j][2] = 1;  			
  			}
  			else {
  				disparition[i][j][1] = 1/2;
  				disparition[i][j][2] = 1/2;
  			}
		}
	}
}

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
  	sum(i in humains) x[i] == 2*N;
  CrtNbrEnfantsMax:
  	forall(i in humains)
  	  0 <= x[i] <= 3;
  CrtProba1:
  	forall(j in genes, k in alleles)
  	  z[j][k] >= t[j][k] - sum(i in humains : individu[i][1][j][1] == individu[i][1][j][2] && individu[i][1][j][1] == k) x[i];
  CrtProba2:
  	forall(r in approx, j in genes, k in alleles)
  	  ln(theta[r]) + (1/theta[r]) * (t[j][k] - theta[r]) >= sum(i in humains : individu[i][1][j][1] != individu[i][1][j][2]) x[i] * ln(0.5);
  CrtZNNeg:
  	forall(j in genes, k in alleles)
  	  z[j][k] >= 0;
}