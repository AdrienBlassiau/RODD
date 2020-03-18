/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Adrien BLASSIAU Corentin JUVIGNY
 * Creation Date: 18 mars 2020 at 14:45:31
 *********************************************/
 

int T=...;
int M=...;

range mode=1..M;
range temps=1..T;

int p[temps][mode]=...;
int f[temps][mode]=...;
int e[temps][mode]=...;

int h[temps]=...;
int d[temps]= ...;
int Emax[temps]=...;
int R=6;

dvar float+ x[temps][mode];
dvar float+ s[temps];
dvar boolean y[temps][mode]; 

minimize
  sum(t in temps) (sum(m in mode) (p[t][m]*x[t][m]+f[t][m]*y[t][m])+h[t]*s[t]);

subject to{
	forall(t in 2..T){
	      sum(m in mode)
	      	x[t][m]-s[t] + s[t-1]==d[t];  
	}	 
}
