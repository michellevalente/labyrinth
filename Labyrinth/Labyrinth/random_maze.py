import numpy
from numpy.random import random_integers as rand
import matplotlib.pyplot as plt
from matplotlib import colors

w = 11
h = 11
 
def maze(width, height, complexity=.20, density=.90):
    
    # Only odd shapes
    shape = ((height // 2) * 2 + 1, (width // 2) * 2 + 1)
    # Adjust complexity and density relative to maze size
    complexity = int(complexity * (5 * (shape[0] + shape[1])))
    density    = int(density * (shape[0] // 2 * shape[1] // 2))
    # Build actual mazes
    Z = numpy.zeros(shape, dtype=bool)
    # Fill borders
    Z[0, :] = Z[-1, :] = 1
    Z[:, 0] = Z[:, -1] = 1

    # Make aisles
    for i in range(density):

        x, y = rand(0, shape[1] // 2) * 2, rand(0, shape[0] // 2) * 2
        Z[y, x] = 1
        for j in range(complexity):
            neighbours = []
            if x > 1:             neighbours.append((y, x - 2))
            if x < shape[1] - 2:  neighbours.append((y, x + 2))
            if y > 1:             neighbours.append((y - 2, x))
            if y < shape[0] - 2:  neighbours.append((y + 2, x))
            if len(neighbours):
                y_,x_ = neighbours[rand(0, len(neighbours) - 1)]
                if Z[y_, x_] == 0:
                    Z[y_, x_] = 1
                    Z[y_ + (y - y_) // 2, x_ + (x - x_) // 2] = 1
                    x, y = x_, y_
    return Z

Z = maze(w, h) 
Y = 1 - Z

while( Z[h-2][w-2] == 1):
    Z = maze(w, h)

Y[1][0] = 1
Y[h - 2][w-1] = 1
count_one = 0
count_zero = 0

cmap = colors.ListedColormap(['black', 'white'])
bounds=[0,1]
norm = colors.BoundaryNorm(bounds, cmap.N)

numpy.savetxt("random_maze.txt", Y, fmt = '%d')  
plt.figure(figsize=(8,8))
plt.imshow(Y,cmap=cmap,interpolation='nearest')
plt.xticks([]),plt.yticks([])
plt.show()
plt.savefig("output.png")

#print(Z)
