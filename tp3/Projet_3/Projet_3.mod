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
int init = ...;

range genes = 1..G;
range paire = 1..C;
range allele = 1..A;
range humain = 1..N;

int individu[humain][paire][genes][allele] = ...;
