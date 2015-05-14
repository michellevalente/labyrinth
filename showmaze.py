import numpy
from numpy.random import random_integers as rand
import matplotlib.pyplot as plt
from matplotlib import colors


def main():
	f = open("maze_output.txt")

	option = raw_input("1 - with best path, 0 - without best path")
	g = numpy.genfromtxt(f)
	if(option == '1'):
		cmap = colors.ListedColormap(['black', 'white', 'yellow'])
		bounds=[0,1,2]
	else:
		cmap = colors.ListedColormap(['black', 'white'])
		bounds=[0,1]
	norm = colors.BoundaryNorm(bounds, cmap.N)

	plt.figure(figsize=(10,10))
	plt.imshow(g,cmap=cmap,interpolation='nearest')
	plt.xticks([]),plt.yticks([])
	plt.show()

main()
