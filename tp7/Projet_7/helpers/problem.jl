"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

@doc """
Module contenant les types relatifs aux instances et aux solutions du problème de lot sizing avec contraintes environnementales "Green Lot Sizing", que l'on note G_ULS.
Il contient les types et les fonctions suivants:

- Instance
- Solution

Utilisez using .G_ULS pour utiliser le module et son contenu dans votre code.

Utiliser ?NOM dans l'interface en ligne de commande Julia pour avoir de la documentation sur NOM.
Par exemple ?Instance affiche la documentation sur le type Instance


""" ->
module G_ULS

  export Instance, Solution

  @doc """
  Type représentant une entrée du problème G_ULS.

  Il n'est pas nécessaire de construire vous même les entrées.
  Utilisez le fichier generate.jl pour cela.

  """
  mutable struct Instance
    T::Int # horizon
    M::Int # nombre de modes
    R::Int # taille de l'intervalle glissant
    Emax::Array{Int} # impact environnementale max
    f::Array{Array{Int}} # cout d'approvisionnement fixe
    e::Array{Array{Int}} # impact environnementale
    h::Array{Int} # cout de stockage unitaire
    p::Array{Array{Int}} # cout d'approvisionnement unitaire
    d::Array{Int} # demande
  end
  Instance() = Instance(0, 0, 0, [], [], [], [], [], []) # Constructeur par défaut

  @doc """
  Type représentant une solution du problème G_ULS.

  Vous n'avez pas à construire une solution à la main. Vous pouvez utiliser :
  - Solution(inst::Instance)

  """
  mutable struct Solution
    inst
    x
    y
    s
  end
  Solution(inst) = Solution(inst,[],[],[]) # Constructeur par défaut


end




