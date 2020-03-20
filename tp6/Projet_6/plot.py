import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, variance, stdev, pstdev

t = np.arange(10., 60.,10)

tab10_1 = [0.03,0.00,0.01,0.00,0.01,0.00,0.01,0.00,0.01,0.01]
tab20_1 = [0.02,0.02,0.03,0.01,0.02,0.02,0.02,0.02,0.01,0.05]
tab30_1 = [0.03,0.03,0.05,0.06,0.03,0.03,0.03,0.03,0.03,0.03]
tab40_1 = [0.06,0.18,0.07,0.05,0.05,0.05,0.12,0.05,0.05,0.05]
tab50_1 = [0.13,0.08,0.09,0.07,0.09,0.09,0.08,0.07,0.11,0.07]
data_to_plot_1 = [tab10_1,tab20_1,tab30_1,tab40_1,tab50_1]
h1 = [mean(tab10_1),mean(tab20_1),mean(tab30_1),mean(tab40_1),mean(tab50_1)]

tab10_2 = [0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00]
tab20_2 = [0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03]
tab30_2 = [0.14,0.15,0.16,0.16,0.15,0.14,0.15,0.15,0.15,0.15]
tab40_2 = [1.75,1.57,1.59,1.57,1.55,1.59,1.57,1.57,1.64,1.55]
tab50_2 = [5.52,4.59,6.15,4.77,4.62,4.58,4.59,4.53,4.66,4.62]

data_to_plot_2 = [tab10_2,tab20_2,tab30_2,tab40_2,tab50_2]
h2 = [mean(tab10_2),mean(tab20_2),mean(tab30_2),mean(tab40_2),mean(tab50_2)]


fig, ax = plt.subplots()
plt.plot(t,h1, "o:", markersize=4)
plt.plot(t,h2, "o:", markersize=4)
plt.legend(['Temps de calcul pour P1','Temps de calcul pour P4'], loc="upper left")
plt.title("Temps moyen de calcul (s) en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps moyen de  calcul (s)")
plt.show()

fig, ax = plt.subplots()
bp = ax.boxplot(data_to_plot_1)
plt.title("Répartition des temps de calcul (s) en fonction de la taille de l'instance pour P1")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps de calcul (s)")
plt.show()

fig, ax = plt.subplots()
bp = ax.boxplot(data_to_plot_2)
plt.title("Répartition des temps de calcul (s) en fonction de la taille de l'instance pour P4")
plt.xlabel("Taille de l'instance")
plt.ylabel("Temps de calcul (s)")
plt.show()