"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

include("./helpers/generate.jl")

using .Generator

generate(12,4,6,3,[10, 30, 60, 90],[8, 6, 4, 2],1,[0, 0, 0, 0],20,70,"instances/test.input")


