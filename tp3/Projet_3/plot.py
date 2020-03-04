import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, variance, stdev, pstdev


# x = [10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,200,300]
# y1 = [0.0146234137194948,0.0152217299304239,0.0154033371394141,0.015482426604255,0.0155241810472989,0.0155490488914568,0.0155651379766199,0.0155776267085092,0.0155880964533051,0.0155957036448688,0.01560138048123,0.0156057116773627,0.0156090784129599,0.0156117373864284,0.0156138663293322,0.0156155912837706,0.0156170035246442,0.0156181703782267,0.0156191423236521,0.0156246614385874,0.0156249989405914]
# y2 = [0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.05,0.07]

# y3 = [0 for i in range(0,21)]

# for i in range(0,21):
# 	y3[i] = (0.015625-y1[i])/0.015625
# 	# print(x[i],",",y1[i],",",y2[i],",")

# plt.plot(x,y1, "o:", markersize=4)
# plt.title("Borne inférieure obtenue en fonction du nombre de morceaux")
# plt.xlabel("Nombre de morceaux")
# plt.ylabel("Borne inférieure")
# plt.show()

# plt.plot(x,y2, "o:", markersize=4)
# plt.title("Temps moyen de calcul (s) en fonction du nombre de morceaux")
# plt.xlabel("Nombre de morceaux")
# plt.ylabel("Temps moyen de calcul (s)")
# plt.show()

# plt.plot(x,y3, "o:", markersize=4)
# plt.title("Gap en fonction du nombre de morceaux")
# plt.xlabel("Nombre de morceaux")
# plt.ylabel("Gap")
# plt.show()

taille2borne = [0.5,1.625,1.125,2.625,1.625,0.875,1.25,2.375,1.75,0.75,2.75]
taille2val = [0.49966577826941,1.62473136636501,1.12459600267209,2.62473136636501,1.62473136636501,0.874663684518554,1.2496615907677,2.37479904821147,1.74979695446062,0.749796954460619,2.74979695446062]
gap2 = [0]*10

taille4borne = [0.0625,0.015625,0.15625,0.1640625,0.0625,0.109375,0.0703125,0.28125,0.078125,0.03125]
taille4val = [0.062383256037828,0.0155880964533051,0.156042922964545,0.163826805354048,0.062383256037828,0.109197654388883,0.0702002210905641,0.280989524445994,0.078035303378974,0.0311849110247004]
gap4 = [0]*10

taille6borne = [0.03125,0.005859375,0.001953125,0.03906125,0.016601562,0.000488281,0.000488281,0.046875,0.000488281,0.002197266]
taille6val = [0.0311849110247004,0.00585560672442359,0.00195186890814119,0.00390176553215443,0.0165643799266878,0.000283136292822739,0.000283136292822739,0.0487161582680566,0.000283136292822738,0.00195186890814119]
gap6 = [0]*10

taille8val = [0,0.000849408878468216,0,0,0,0.000283136292822738,0,0,0,0,0]
taille8borne = [0.000488281,0.001525879,0,0,0,0.000976562,0.000061035,0,0,0,0.000061035]
gap8 = [0]*10

taille10val = [0,0.000849408878468216,0,0,0,0.000283136292822738,0,0,0,0,0]
taille10borne = [0.000488281,0.001525879,0,0,0,0.000976562,0.000061035,0,0,0,0.000061035]
gap10 = [0]*10

for i in range(0,10):
	gap2[i] = 0 if taille2borne[i]==0 else (abs(taille2val[i]-taille2borne[i]))/taille2borne[i]
	gap4[i] = 0 if taille4borne[i]==0 else (abs(taille4val[i]-taille4borne[i]))/taille4borne[i]
	gap6[i] = 0 if taille6borne[i]==0 else (abs(taille6val[i]-taille6borne[i]))/taille6borne[i]
	gap8[i] = 0 if taille8borne[i]==0 else (abs(taille8val[i]-taille8borne[i]))/taille8borne[i]
	gap10[i] = 0 if taille10borne[i]==0 else (abs(taille10val[i]-taille10borne[i]))/taille10borne[i]

x = [2,4,6,8,10]
y1 = [mean(taille2borne),mean(taille4borne),mean(taille6borne),mean(taille8borne),mean(taille10borne)]
y2 = [mean(gap2),mean(gap4),mean(gap6),mean(gap8),mean(gap10)]
y3 = [taille2borne,taille4borne,taille6borne,taille8borne,taille10borne]

plt.plot(x,y1, "o:", markersize=4)
plt.title("Espérance du nombre d'allèles disparus en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Espérance du nombre d'allèles disparus")
plt.show()

plt.plot(x,y2, "o:", markersize=4)
plt.title("Gap en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Gap")
plt.show()

fig, ax = plt.subplots()
bp = ax.boxplot(y3)
plt.title("Répartition de l'espérance du nombre d'allèles disparus en fonction de la taille de l'instance")
plt.xlabel("Taille de l'instance")
plt.ylabel("Espérance du nombre d'allèles disparus")
plt.show()