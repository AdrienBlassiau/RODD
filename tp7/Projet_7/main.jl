"""
Authors: Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

include("helpers/generate.jl")
include("helpers/problem.jl")

using .G_ULS
using .Generator

@doc """
Prend un fichier en entrée et exécute un algorithme avec.
""" ->
function main(input_file::String)

	inst = generate(input_file)
	sol = Solution(inst)

	cpu_time = @elapsed(others = run(inst, sol))

	post_process(cpu_time, inst, sol, others)
end