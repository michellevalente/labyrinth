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

  	char * test;
  	int i = 0;
    int j = 0;

    int numberNodes;

    ifstream File;
    File.open("maze.txt");
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
 
    int ** neighbors = graph.getNeighbors();

    for(int i = 0; i < numberNodes; i++)
    {
      for(int j = 0; j< 4 ; j++)
      {
        cout << neighbors[i][j] << " ";
      }

      cout << "\n";
    }
	
}

