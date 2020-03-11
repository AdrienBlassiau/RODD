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

execute COMPUTE_A {
	for(var i in height) {
		for(var j in width) {
			for(var k in height) {
				for(var l in width) {
					if ((i == k+1 && k+1 < m+1) 
					     || (i == k-1 && k-1 > 0) 
					     || (j = l+1 && l+1 < n+1)
					     || (j == l-1 && l-1 > 0)) 
						A[i][j][k][l] = 1;
				}
			}
		}
	}
}

maximize w1 * sum(i in height, j in width) t[i][j] * (1 - x[i][j]) + w2 * g * L * sum(i in height, j in width) (4*x[i][j] - d[i][j]);