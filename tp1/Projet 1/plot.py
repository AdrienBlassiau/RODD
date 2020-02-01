import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, variance, stdev, pstdev

t = np.arange(10., 110., 10)

tab10 = [0.04, 0.03, 0.09, 0.22, 0.06, 0.24, 0.03, 0.12, 0.13, 0.09]
tab20 = [0.13, 0.13, 0.08, 0.18, 0.10, 0.13, 0.39, 0.11, 0.19, 0.15]
tab30 = [0.36, 0.18, 0.28, 0.23, 0.23, 0.25, 0.21, 0.26, 0.44, 0.48]
tab40 = [1.04, 1.10, 0.64, 0.49, 0.82, 0.60, 0.73, 0.56, 0.53, 1.11]
tab50 = [1.22, 2.04, 1.30, 5.11, 1.35, 1.85, 1.94, 1.05, 1.22, 1.12]
tab60 = [7.66, 2.32, 2.33, 4.08, 2.02, 4.99, 5.48, 1.67, 1.40, 5.31]
tab70 = [4.24, 7.18, 4.66, 3.76, 4.26, 3.49, 4.56, 1.91, 13.40, 5.93]
tab80 = [9.51, 9.49, 0.80, 4.35, 9.03, 5.65, 4.63, 3.96, 11.08, 12.64]
tab90 = [6.10, 14.39, 11.08, 7.88, 25.36, 8.41, 7.63, 1.62, 12.73, 7.10]
tab100 = [18.67, 12.99, 32.13, 15.06, 20.40, 9.33, 2.33, 15.31, 10.11, 20.43]

data_to_plot = [tab10,tab20,tab30,tab40,tab50,tab60,tab70,tab80,tab90,tab100]
h = [mean(tab10),mean(tab20),mean(tab30),mean(tab40),mean(tab50),mean(tab60),mean(tab70),mean(tab80),mean(tab90),mean(tab100)]


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