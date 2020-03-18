"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020

Programme pour lancer une batterie de tests.

Utilisation :
Supposons pour l'exemple que vous avez un algorithme dans le fichier "pl.jl"
et un dossier "instances" contenant des fichier ".input".
Placez vous à la racine du dossier du projet (dans le dossier contenant pl.jl et helpers)
et tapez la commande suivante.

julia helpers/tester.jl algorithm_test.jl instances/

Cette commande exécutera l'algorithme pl.jl sur tous les fichiers ".input" du dossier.

"""

println("Chargement des bibliothèques.")


using Distributions
using JuMP
using CPLEX

m = Model(with_optimizer(CPLEX.Optimizer))

println("Chargement terminé.")



# Ne pas enlever
if length(ARGS) == 2
  algorithm = ARGS[1]
  test_folder = ARGS[2]
  if test_folder[length(test_folder)] != '/'
    test_folder *= "/"
  end

  while length(ARGS) > 0
    pop!(ARGS)
  end

  include("../" * algorithm)
  for input_file in readdir(test_folder)
    if(endswith(input_file, ".txt"))
      println(input_file)
      main(test_folder * input_file)
    end
  end
end

