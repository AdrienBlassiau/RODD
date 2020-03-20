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
dvar float+ y[height][width][height][width];

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

maximize
  w1 * sum(i in width, j in height) t[i][j] * (1-x[i][j]) + 
  w2*g*L* sum(i in width, j in height, k in width, l in height) A[i][j][k][l] *(x[i][j] - y[i][j][k][l]) + 
  w2*g*L* sum(i in width) (x[i][1] + x[i][n]) +
  w2*g*L* sum(i in width) (x[1][i] + x[m][i]);
 
subject to{
	forall (i in width, j in height, k in width, l in height: A[i][j][k][l]==1) {
		1-x[i][j]-x[k][l]+y[i][j][k][l] >= 0;
		y[i][j][k][l]>=0;
	}
	forall (i in width, j in height) {
		x[i][j] <= 1;	
	}
	//sum(i in width, j in height) x[i][j] >= 60;
}
