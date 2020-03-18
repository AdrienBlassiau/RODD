"""
Authors : Adrien BLASSIAU Corentin JUVIGNY
TP RODD - 2019-2020
"""

@doc """
Module contenant 3 fonctions de génération d'instances du problème G_ULS.
  Il contient 3 fonctions
  - `generate(T, M, R, Emax, dmin, dmax)` génère une instance.
  - `generate(T, M, R, Emax, dmin, dmax, filename)` génère une instance et écrit le tout dans le fichier filename.
  - `generate(filename) renvoie l'instance décrite dans le fichier filename (généré avec la fonction précédente)

Utilisez using .Generator pour utiliser le module et son contenu dans votre code.

Utiliser ?NOM dans l'interface en ligne de commande Julia pour avoir de la documentation sur NOM.
Par exemple ?generate affiche la documetation sur les fonctions generate
""" ->
module Generator

  export generate

  include("./problem.jl")
  import .G_ULS: Instance
  using Distributions
  using Dates

  @doc """
  Prérequis : installation des paquets suivants :
  (using Pkg ; Pkg.add("Distributions"))
  (using Pkg ; Pkg.add("Dates"))

  Fonction de génération d'instance.
  """ ->
  function generate(T::Int, M::Int, R::Int, Emax::Int, f::Array{Int}, e::Array{Int}, h::Int, p::Array{Int}, dmin::Int, dmax::Int)
    inst = Instance()

    if (length(f) != M) || (length(e) != M) || (length(p) != M)
      println("Impossible de générer une instance, f ou e de maucvaise taille")
      return inst
    end

    # Paramètres de base
    inst.T = T
    inst.M = M
    inst.R = R

    # Loi de probabilité
    d_distrib = Distributions.DiscreteUniform(dmin, dmax)

    # Emax
    for i in 1:inst.T
        push!(inst.Emax, Emax)
    end

    # f
    for i in 1:inst.T
      push!(inst.f, f)
    end

    # e
    for i in 1:inst.T
      push!(inst.e, e)
    end

    # h
    for i in 1:inst.T
      push!(inst.h, h)
    end

    # p
    for i in 1:inst.T
      push!(inst.p, [])
      for m in 1:inst.M
        push!(inst.p[i], p[m])
      end
    end

    # d
    for i in 1:inst.T
      push!(inst.d, rand(d_distrib))
    end

    return inst
  end


  @doc """
  Prérequis : installation des paquets suivants :
  (using Pkg ; Pkg.add("Distributions"))
  (using Pkg ; Pkg.add("Dates"))

  Utilise la fonction `generate(w, h, n, pw, ph, bounds_ω, bounds_ma)` pour construction une instance puis écriture de cette instance dans le fichier dont le chemin est `filename`.
  """ ->
  function generate(T::Int, M::Int, R::Int, Emax::Int, f::Array{Int}, e::Array{Int}, h::Int, p::Array{Int}, dmin::Int, dmax::Int, filename::String)

    inst = generate(T, M, R, Emax, f, e, h, p, dmin, dmax)

    datetimenow = Dates.now()
    date = Dates.format(datetimenow, "e, dd u yyyy HH:MM:SS")

    open(filename, "w") do file
      write(file,
        "/**********************************************\n* Author: Adrien BLASSIAU Corentin JUVIGNY\n* Creation Date: $date\n*********************************************/")
      write(file, "\n\n")


      write(file, "T=$(inst.T);\n")
      write(file, "M=$(inst.M);\n")
      write(file, "R=$(inst.R);\n")
      write(file, "Emax=$(inst.Emax);\n")

      write(file, "f=[")
      for i in 1:inst.T-1
        write(file, "$(inst.f[i])")
        write(file, ",")
      end
      write(file, "$(inst.f[T])];\n")

      write(file, "e=[")
      for i in 1:inst.T-1
        write(file, "$(inst.e[i])")
        write(file, ",")
      end
      write(file, "$(inst.e[T])];\n")


      write(file, "h=$(inst.h);\n")

      write(file, "p=[")
      for i in 1:inst.T-1
        write(file, "$(inst.p[i])")
        write(file, ",")
      end
      write(file, "$(inst.p[T])];\n")

      write(file, "d=$(inst.d);\n")

    end
    return inst
  end


  @doc """
  generate(filename::String)

  Lecture fichier de données.

  Cette fonction lit un fichier dont le chemin est `filename` et renvoie un objet de type Instance contenant les informations écrites dans le fichier.
  """ ->
  function generate(filename::String)

    open(filename) do file
      lines = readlines(file)

      inst = Instance()

      line = lines[6]
      inst.T = parse(Int64, SubString(line,3,length(line)-1))

      line = lines[7]
      inst.M = parse(Int64, SubString(line,3,length(line)-1))

      line = lines[8]
      inst.R = parse(Int64, SubString(line,3,length(line)-1))

      line = lines[9]
      inst.Emax = Meta.parse(SubString(line,6,length(line)-1)) |> eval

      line = lines[10]
      inst.f = Meta.parse(SubString(line,3,length(line)-1)) |> eval

      line = lines[11]
      inst.e = Meta.parse(SubString(line,3,length(line)-1)) |> eval

      line = lines[12]
      inst.h = Meta.parse(SubString(line,3,length(line)-1)) |> eval

      line = lines[13]
      inst.p = Meta.parse(SubString(line,3,length(line)-1)) |> eval

      line = lines[14]
      inst.d = Meta.parse(SubString(line,3,length(line)-1)) |> eval

      return inst
    end

  end
end
