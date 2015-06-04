import numpy
from numpy.random import random_integers as rand
import matplotlib.pyplot as plt
from matplotlib import colors


def main():
	f = open("maze_output.txt")
	f2 = open("nodes.txt")
	nodes = {}

	g = numpy.genfromtxt(f)
	cmap = colors.ListedColormap(['black', 'white', 'yellow'])
	bounds=[0,1,2]
	norm = colors.BoundaryNorm(bounds, cmap.N)

	fig = plt.figure(figsize=(10,10))
	ax = fig.add_subplot(111)

	line = f2.readline()
	i = 0
	while(line != ""):
		y, x = line.split(" ")
		nodes[i] = (x,y)
		line = f2.readline()
		i = i + 1

	j = 0
	for node in nodes:
		x = nodes[node][0]
		y = nodes[node][1]
		ax.annotate(str(j), xy=(0,-0.4), xytext=(x,y), fontsize = 5, color = 'red', weight = 'bold')
		j = j + 1

	plt.imshow(g,cmap=cmap,interpolation='nearest')
	plt.savefig('maze.png')
	plt.xticks([]),plt.yticks([])
	plt.show()
	plt.savefig("output2.png")

main()
