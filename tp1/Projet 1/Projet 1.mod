/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Corentin JUVIGNY	Adrien BLASSIAU
 * Creation Date: 22 Jan 2020 at 14:52:15
 *********************************************/

int m = ...;
int n = ...;
int p = ...;
int q = ...;

range height = 1..m;
range width = 1..n;
range species = 1..(p+q);
range rare = 1..p;
range common = (p+1)..(p+q);

float alpha[species] = ...;

float proba[species][height][width] = ...;

int c[height][width] = ...;

dvar boolean xp[height][width];
dvar boolean xc[height][width];

minimize sum(i in height) sum(j in height) c[i][j] * xp[i][j];

subject to {
  ctBords:
	sum(i in height) xc[i][1] == 0;
	sum(i in height) xc[i][m] == 0;
	sum(j in width) xc[1][j] == 0;
	sum(j in width) xc[n][j] == 0;
  ctProtectedArea:
  	forall(i in 2..m-1)
  	  forall(j in 2..n-1)
  	  	9 * xc[i][j] <= sum(a in (i-1)..(i+1)) sum (b in (j-1)..(j+1)) xp[a][b];
  ctProbaRare:
  	forall(k in rare)
  	  sum(i in height)
  	    sum(j in width)
  	      log(1-proba[k][i][j]) * xc[i][j] <= log(1-alpha[k]);
  ctProbaCommon:
  	forall(k in common)
  	  sum(i in height)
  	    sum(j in width)
  	      log(1-proba[k][i][j]) * xp[i][j] <= log(1-alpha[k]);
}