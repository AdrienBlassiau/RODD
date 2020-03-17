/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Adrien BLASSIAU Corentin JUVIGNY
 * Creation Date: 11 mars 2020 at 13:04:06
 *********************************************/

int P = ...;
int m = ...;
int n = ...;
int w1 = ...;
int w2 = ...;
int L = ...;
float g = ...;

range width = 1..n;
range height = 1..m;
int t[height][width] = ...;

int A[height][width][height][width];

dvar boolean x[height][width];
dvar float+ d[height][width];

execute COMPUTE_AB {
	for(var i in height) {
		for(var j in width) {
			if (j > 1) {
				A[i][j][i][j-1] = 1;
			}
			if (j < n) {
				A[i][j][i][j+1] = 1;
			}
			if (i > 1) {
				A[i][j][i-1][j] = 1;
			}
			if (i < m) {
				A[i][j][i+1][j] = 1;
			}
		}		
	}
}

maximize w1 * (sum(i in height, j in width) t[i][j] * (1 - x[i][j])) + w2 * g * L * (sum(i in height, j in width) (4*x[i][j] - d[i][j]));

subject to {
  ComputeD :
  	forall (i in height)
  	  forall (j in width)
  		d[i][j] >= sum(k in height, l in width) A[i][j][k][l] * x[k][l] - 4 * (1 - x[i][j]);
  LIMITParcell :
	sum(i in height, j in width) x[i][j] >= 60;
}