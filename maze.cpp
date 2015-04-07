#include <iostream>
#include "graph.h"
#include <vector>

vector<Node> nodes;

const int r = 5;
const int c = 6;
bool isCorner(bool maze[r][c], int i, int j)
{
	int left =0;
	int right = 0;
	int top = 0;
	int bottom = 0;
	int total = 0;

	if(maze[i][j] == 0)
		return false;

	if( j > 0)
		if(maze[i][j - 1] == 1)
			left = 1;

	if( i > 0)
		if(maze[i - 1][j] == 1)
			top = 1;

	if(maze[i][j + 1] == 1)
		right = 1;
	if(maze[i + 1][j] == 1)
		bottom = 1;

	total = right + bottom + top + left;

	if( total == 1 )
		return true;

	else if(total > 2)
		return true;

	else
	{
		if((top == 1 && bottom == 1) || (left == 1 && right == 1))
			return false;
		else
			return true;
	}

}

int numberNodes(bool maze[r][c], int length, int width)
{
	int countNodes = 0;
	for(int i = 0; i < length; i++)
	{
		for(int j = 0; j < width; j++ )
		{
			if(isCorner(maze, i, j))
			{
				countNodes++;
				Node newNode(i,j,countNodes);
				nodes.push_back(newNode);
			}
		}
	}

	return countNodes;
}

int isConnected(Node node1, Node node2, bool maze[r][c])
{
	int x1 = node1.getX();
	int x2 = node2.getX();
	int y1 = node1.getY();
	int y2 = node2.getY();
	int temp = 0;
	int value = 1;

	if(x1 == x2)
	{
		if(y1 < y2)
		{
			temp = y1;
			value = maze[x1][temp];
		
			while(temp != y2 && value != 0 )
			{
				temp++;
				value = maze[x1][temp];
			}
			if(temp == y2)
				return (y2 - y1);
			else
				return 0;
		}
		else
		{
			temp = y2;
			value = maze[x1][temp];
		
			while(temp != y1 && value != 0 )
			{
				temp++;
				value = maze[x1][temp];
			}
			if(temp == y1)
				return (y1 - y2);
			else
				return 0;
		}

	}

	if(y1 == y2)
	{
	
		if(x1 < x2)
		{
			temp = x1;
			value = maze[temp][y1];
		
			while(temp != x2 && value != 0 )
			{
				temp++;
				value = maze[temp][y1];
			}

			if(temp == x2)
				return (x2 - x1);
			else
				return 0;
		}
		else
		{
			temp = x2;
			value = maze[temp][y1];
		
			while(temp != x1 && value != 0 )
			{
				temp++;
				value = maze[temp][y1];
			}
			if(temp == x1)
				return (x1 - x2);
			else
				return 0;
		}

	}

	return 0;
}

Graph generateGraph(bool maze[r][c], int length, int width)
{
	int num_nodes = numberNodes(maze, length, width);
	Graph g(num_nodes);

	int edge;

	for(int i = 0; i < nodes.size(); i++)
	{
		Node temp1 = nodes[i];

		for(int j = i; j < nodes.size(); j++)
		{
			Node temp2 = nodes[j];
			edge = isConnected(temp1,temp2, maze);

			if(edge != 0)
			{
				g.addEdge(temp1.getIndex() - 1, temp2.getIndex() - 1, edge );
			}
		}

	}

	return g;
}


int main(void)
{
	 bool maze[r][c] =  { {0,0,0,1,0},
	 					  {0,0,1,1,0},
	 					  {0,0,1,0,0},
	 					  {0,0,1,0,0},
	 					  {1,1,1,0,0},
	 	
	 					};

	 int n = numberNodes(maze, r, c);
	 
	 cout << n << endl;
	 
	 for(int i = 0; i < nodes.size() ; i++)
	 {
	 	nodes[i].showInfo();
	 }

	 Graph g = generateGraph(maze, 5, 6);

	 g.showMatrix();
}

