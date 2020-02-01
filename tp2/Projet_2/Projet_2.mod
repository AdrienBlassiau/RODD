/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Adrien BLASSIAU Corentin JUVIGNY
 * Creation Date: 29 Jan 2020 at 14:14:08
 *********************************************/

int m = ...;
int n = ...;
int B = ...;
int Amin = ...;
int Amax = ...;
float lambda = ...;

range height = 1..m;
range width = 1..n;

int c[height][width] = ...;

dvar boolean x[height][width];

dvar boolean y[height][width][height][width];

float d[height][width][height][width];

dvar float+ f;
dvar float+ g;

execute COMPUTE_DIST {
	for(var i1 in height){
		for(var j1 in width){
			for(var i2 in height){
				for(var j2 in width){
					d[i1][j1][i2][j2] = Math.sqrt( Math.pow((i1-i2),2) + Math.pow((j1-j2),2) )
				}
			}
		}
	}
}

minimize f - lambda * g;

subject to {
  Computef :
 	f == sum(i1 in height) sum(j1 in width) sum(i2 in height) sum(j2 in width : i2 != i1 || j2 != j1) d[i1][j1][i2][j2]*y[i1][j1][i2][j2];

  Computeg :
 	g == sum(i in height) sum(j in width) x[i][j];

  TotalArea :
 	sum(i in height) sum(j in width) x[i][j] <= Amax;
	Amin <= sum(i in height) sum(j in width) x[i][j];

  BinPack :
  	sum(i in height) sum(j in width) 10 * x[i][j]*c[i][j] <= B;

  SameDist :
  	sum(i in height) sum(j in width) y[i][j][i][j] == 0;

  MinDist1 :
  	forall(i1 in height)
  	  forall(j1 in width)
  	    forall(i2 in height)
  	      forall(j2 in width)
  	        y[i1][j1][i2][j2] <= x[i2][j2];

  MinDist2 :
  	forall(i1 in height)
  	  forall(j1 in width)
  	    sum(i2 in height) sum(j2 in width) y[i1][j1][i2][j2] == x[i1][j1];

}

execute PRINT_SOLUCE {
	for (var i in height){
		for (var j in width)
			write(x[i][j] + ", ");
		writeln("");
	}	
	writeln(lambda);
	writeln(f/g)
	writeln(f)
	writeln(lambda*g)
}

//execute PRINT_SOLUCE_2 {
//	for (var i1 in height)
//		for (var j1 in width)
//			for (var i2 in height)
//				for (var j2 in width)
//					write(y[i1][j1][i2][j2] + " ");
//	writeln();
//}

main{
	thisOplModel.generate();

	var epsilon = 0.001;
	var nb_iter = 1;
	var obj_value = 10.0;

	while(Math.abs(obj_value) > epsilon){
		cplex.solve();
		thisOplModel.postProcess();	
	
		var currentf = thisOplModel.f;
		var currentg = thisOplModel.g;
		var currentlambda = currentf/currentg;
		
		var subData = new IloOplDataElements();
		var masterOpl = thisOplModel;
    	subData.m = masterOpl.m;
    	subData.n = masterOpl.n;
    	subData.B = masterOpl.B;
    	subData.Amin = masterOpl.Amin;
    	subData.Amax = masterOpl.Amax;
    	subData.c = masterOpl.c;
		subData.lambda = currentlambda;	
     	nb_iter = nb_iter+1;
     	
     	writeln("Obj: ", cplex.getObjValue());
		writeln("Amin: ", subData.Amin);
    	writeln("Amax: ", subData.Amax);
    	writeln("B: ", subData.B);
    	writeln("Nb itérations: ", nb_iter);
    	writeln("Nb parcelles sélectionnées: ", currentg);
    	writeln("DMPPV: ", subData.lambda);
    
		var def = thisOplModel.modelDefinition;
		thisOplModel = new IloOplModel(def,cplex);
		thisOplModel.addDataSource(subData);

		thisOplModel.generate();
		cplex.solve();
		thisOplModel.postProcess();
		
		obj_value = cplex.getObjValue()
	}
}


















