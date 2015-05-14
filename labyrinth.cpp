#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <stdlib.h>
#include "graph.hpp"

using namespace std;

int main()
{
	bool graph_bool[r][c];
	int graph_int[r][c];
	vector<Node> nodes;
	char * test;
	int i = 0;
	int j = 0;

	int numberNodes;

	ifstream File;
	File.open("random_maze.txt");
	char output[100];
	if (File.is_open()) {
		while (!File.eof()) {

			File >> graph_bool[i][j] ;
			j++;
			if(j == c)
			{
				i +=1;
				j = 0;
			}


		}
	}

	File.close();

	Graph graph = generateGraph(graph_bool, r, c);

	numberNodes = graph.numberNodes();

	cout << numberNodes << endl;

	ofstream outFile;

	outFile.open("maze_output.txt");

	nodes = graph.getNodes();

	for(int i = 0; i < r; i++)
	{
		for(int j = 0; j < r; j++)
		{
			graph_int[i][j] = graph_bool[i][j];
		}
	}

    for(int i = 0 ; i < nodes.size();  i++)
    {
      int x = nodes[i].getX();
      int y = nodes[i].getY();
      graph_int[x][y] = 2;

    }

    //int ** neighbors = graph.getNeighbors();

	char option;
	cout << "Show best path? (y/n)";
	cin >> option;
	if(option == 'y')
	{
		int path_node1;
		int path_node2;

		cout << " Enter the nodes in the best path: " << endl;
		cout << "Node index: " << endl;
		cin >> path_node1;
		cout << "Node index: " << endl;
		cin >> path_node2;

		while(path_node1 != -1)
		{
			int x1 = nodes[path_node1].getX();
			int y1 = nodes[path_node1].getY();
			int x2 = nodes[path_node2].getX();
			int y2 = nodes[path_node2].getY();
			graph_int[x1][y1] = 2;
			graph_int[x1][y1] = 2;


			if(y1 == y2)
			{
				if(x1 < x2)
				{
					int i = x1 ;
					while(i != x2)
					{
						graph_int[i][y1] = 2;
						i++;
					}

				}
				else
				{
					int i = x2 ;
					while(i != x1)
					{
						graph_int[i][y1] = 2;
						i++;
					}
				}
			}
			if(x1 == x2)
			{
				if(y1 < y2)
				{
					int i = y1 ;
					while(i != y2)
					{
						graph_int[x1][i] = 2;
						i++;
					}

				}
				else
				{
					int i = y2 ;
					while(i != y1)
					{
						graph_int[x1][i] = 2;
						i++;
					}
				}
			}
			path_node1 = path_node2;
			cout << "Node index: " << endl;
			cin >> path_node2;
		}
	}

	for(int i = 0; i < r ; i++)
	{
		for(int j = 0 ; j < c; j++)
		{
			outFile << graph_int[i][j] << " ";
		}

		outFile << "\n";
	}

    // for(int i = 0; i < numberNodes; i++)
    // {
    //   for(int j = 0; j< 4 ; j++)
    //   {
    //     cout << neighbors[i][j] << " ";
    //   }

    //   cout << "\n";
    // }

}

