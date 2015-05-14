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

    for(int i = 0; i < r ; i++)
    {
      for(int j = 0 ; j < c; j++)
      {
        outFile << graph_int[i][j] << " ";
      }

      outFile << "\n";
    }
    // int ** neighbors = graph.getNeighbors();

    // for(int i = 0; i < numberNodes; i++)
    // {
    //   for(int j = 0; j< 4 ; j++)
    //   {
    //     cout << neighbors[i][j] << " ";
    //   }

    //   cout << "\n";
    // }
	
}

