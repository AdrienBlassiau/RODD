import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, variance, stdev, pstdev

# t = np.arange(5., 35., 5)
t = np.arange(5., 30., 5)

tab5 = [0.13, 0.13, 0.15, 0.14, 0.11, 0.09, 0.12, 0.29, 0.14, 0.18]
tab10 = [0.77, 0.79, 0.77, 0.83, 0.95, 0.79, 0.98, 0.89, 1.07, 0.89]
tab15 = [7.18, 6.60, 6.40, 8.02, 6.84, 6.70, 7.34, 7.24, 6.17, 6.26]
tab20 = [41.20, 37.17, 46.51, 36.07, 43.21, 44.06, 43.60, 40.39, 39.34,37.80]
tab25 = [145.77, 136.79, 145.25, 153.97, 174.33, 145.93, 143.64, 142.09, 140.86, 148.46]
# tab30 = []

# data_to_plot = [tab5,tab10,tab15,tab20,tab25,tab30]
# h = [mean(tab5),mean(tab10),mean(tab15),mean(tab20),mean(tab25),mean(tab30)]

data_to_plot = [tab5,tab10,tab15,tab20,tab25]
h = [mean(tab5),mean(tab10),mean(tab15),mean(tab20),mean(tab25)]


fig, ax = plt.subplots()
plt.plot(t,h, "o:", markersize=4)
plt.yscale("log")
plt.title("Temps moyen de calcul (s) en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps moyen de  calcul (s)")
plt.show()


fig, ax = plt.subplots()
plt.plot(t,h, "o:", markersize=4)
plt.title("Temps moyen de calcul (s) en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps moyen de  calcul (s)")
plt.show()

fig, ax = plt.subplots()
bp = ax.boxplot(data_to_plot)
plt.title("Répartition des temps de calcul (s) en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps de calcul (s)")
plt.show()