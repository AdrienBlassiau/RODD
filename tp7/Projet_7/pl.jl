"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

# Ne pas enlever
include("./main.jl")

println("Chargement de JuMP")
using JuMP
println("Chargement de CPLEX")
using CPLEX
println("Cplex chargé")

@doc """
Modifie la solution sol de l'instance inst en appliquant CPLEX sur un
programme linéaire modélisant le problème (G_ULS).
""" ->
function run(inst, sol)
    T = inst.T
    M = inst.M
    R = inst.R
    Emax = inst.Emax
    f = inst.f
    e = inst.e
    h = inst.h
    p = inst.p
    d = inst.d

	m = Model(with_optimizer(CPLEX.Optimizer))

	@variable(m, 0 <= x[1:T,1:M])
	@variable(m, 0 <= s[1:T])
	@variable(m, y[1:T,1:M], Bin)

	## OBJECTIF
	##
	@objective(m, Min, sum(sum(p[t][m]*x[t,m]+f[t][m]*y[t,m] for m in 1:M) +h[t]*s[t] for t in 1:T))

	## CONTRA1NTE 1
	##
	## Contrainte de conservation
	@constraint(m, constraint1[t in 2:T], sum(x[t,m]-s[t]+s[t-1] for m in 1:M) == d[t])

	## CONTRA1NTE 2
	##
	## Contrainte de conservation
	@constraint(m, constraint2, sum(x[1,m]-s[1] for m in 1:M) == d[1])

	## CONTRA1NTE 3
	##
	## Contrainte de demande
	@constraint(m, constraint3[t in 1:T; m in 1:M], sum(d[t1] for t1 in t..T)*y[t,m]>=x[t,m])

	## CONTRA1NTE 4
	##
	## Contrainte écologique
	@constraint(m, constraint4[t in R:T], sum(sum( (e[t][m]-Emax[t1])*x[t1,m] for m in 1:M) for t1 in t-R+1:t) <=0)


	optimize!(m)

	# solx = value.(x)

	# for i in 1:n
	# 	for j in 1:n
	# 		tagi = inst.tag[i]
	# 		tagj = inst.tag[j]
	# 		solx[tagi,tagj] = if solx[i,j] > 0.0 solx[i,j] else solx[tagi,tagj] end
	# 	end
	# end
	# sol.x = solx

	return m
end


@doc """
Cette fonction est appelée après la fonction `run` et permet de faire de l'affichage et des traitement sur la sortie de la fonction `run` ; sans pour autant affecter son temps de calcul.

Le paramètre cpu time est le temps de calcul de `run`. Les valeurs de `inst` et `sol` sont les mêmes qu’à la sortie de la fonction run. Enfin, `others` est ce qui est renvoyé par la fonction `run`. Vous pouvez ainsi effectuer des tests et afficher des résultats sans affecter le temps de calcul.
""" ->
function post_process(cpu_time::Float64, inst, sol, others)

	# Run a renvoyé le modèle et ses variables, qui ont été mis dans others.
	m = others

	print(m)
	# println()

	# n = inst.n
	# solx = value.(x)
	# nb_routes = 0
	# for i in 1:n
	# 	if solx[1,i]>10e-5
	# 		nb_routes+=1
	# 	end
	# end

	# println("TERMINAISON : ", termination_status(m))
	println("OBJECTIF : $(objective_value(m))")
	# println("NOMBRE DE ROUTES : $nb_routes")
	# println("VALEURS de τ : $(value.(τ))")
	# println("VALEURS de u : $(value.(u))")
	# println("VALEURS de y : $(value.(y))")
	# println("VALEURS de x : $(value.(x))")

	println("Temps de calcul : $cpu_time.")
end

# Ne pas enlever
if length(ARGS) > 0
	input_file = ARGS[1]

	main(input_file)
end
