"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

include("./helpers/generate.jl")

using .Generator


T = 12
M = 5
R = 6
Emax = 5
f = [[10, 30, 60, 90],[10, 30, 60, 90, 120, 150],[10, 30, 60, 90, 120, 150, 180, 210]]
e = [[8, 7, 6, 5],[8, 7, 6, 5, 4, 3],[8, 7, 6, 5, 4, 3 ,2 ,1]]
h = 1
p = [[0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0]]
dmin = 20
dmax = 70
# d = Array{Int,1}(undef, T)
d=[48, 34, 35, 69, 43, 70, 45, 62, 41, 25, 37, 46];

# for i in 1:T
# 	d[i] = rand(dmin:dmax)
# end

for r in 1:T
	generate(T, 4, r, Emax, f[1], e[1], h, p[1], d,"instances/var_M/set_4/inst_$(10+r).dat")
end

for r in 1:T
	generate(T, 6, r, Emax, f[2], e[2], h, p[2], d,"instances/var_M/set_6/inst_$(10+r).dat")
end


for r in 1:T
	generate(T, 8, r, Emax, f[3], e[3], h, p[3], d,"instances/var_M/set_8/inst_$(10+r).dat")
end



