#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <stdlib.h>
#include "graph.hpp"
#include <stdio.h>
#include "vga_led.h"
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

using namespace std;

int vga_led_fd;

/* Write the contents of the array to the display */
void write_segments(unsigned int segs)
{
  vga_led_arg_t vla;
  int i;
  for (i = 0 ; i < VGA_LED_DIGITS ; i = i+1) {
    vla.digit = i; 
    vla.segments = segs;
    if (ioctl(vga_led_fd, VGA_LED_WRITE_DIGIT, &vla)) {
      perror("ioctl(VGA_LED_WRITE_DIGIT) failed");
      return;
    }
  }
}

int main()
{
	bool graph_bool[r][c];
	int graph_int[r][c];
	vector<Node> nodes;
	char * test;
	int i = 0;
	int j = 0;
	vga_led_arg_t vla;
  	static const char filename[] = "/dev/vga_led";
  	unsigned int message;	
	unsigned int dumbNode1 = 0;
	unsigned int dumbNode2 = 1073741824;

	printf("\nLabyrinth Userspace program started\n");
	if ( (vga_led_fd = open(filename, O_RDWR)) == -1) 
	{
   		fprintf(stderr, "could not open %s\n", filename);
    		return -1;
	}

	

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

	cout << "First node to enter: "<< numberNodes -1 << endl;

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

    // for(int i = 0 ; i < nodes.size();  i++)
    // {
    //   int x = nodes[i].getX();
    //   int y = nodes[i].getY();
    //   graph_int[x][y] = 2;

    // }

    int x = nodes[0].getX();
    int y = nodes[0].getY();

    graph_int[x][y] = 2;

    x = nodes[numberNodes - 1 ].getX();
    y = nodes[numberNodes - 1 ].getY();

    graph_int[x][y] = 2;

    unsigned int ** neighbors = graph.getNeighbors();
	

	message = 2147483648 + numberNodes;		
	write_segments(message);

	for(int i = 0; i < numberNodes; i++)
	{
		write_segments(neighbors[i][0]);
		write_segments(neighbors[i][1]);
	}

	for(int i = numberNodes; i < 32 ; i++)
	{
		write_segments(dumbNode1);
		write_segments(dumbNode2);
	}
	
	
	
	char option;
	cout << "Enter best path? (y/n)" << endl;
	cin >> option;
	if(option == 'y')
	{
		unsigned int path_node1;
		unsigned int path_node2;

		cout << " Enter the nodes in the best path: " << endl;
		cout << "Node index: " << endl;
		cin >> path_node1;
		write_segments(path_node1);
		
		cout << "Node index: " << endl;
		cin >> path_node2;
		write_segments(path_node2);

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
			if(path_node2 == -1)
				break;
			write_segments(path_node2);
		}
	}
	

	x = nodes[0].getX();
	y = nodes[0].getY();

	graph_int[x][y] = 2;
	
	x = nodes[numberNodes - 1].getX();
	y = nodes[numberNodes - 1].getY();

	graph_int[x][y] = 2;

	for(int i = 0; i < r ; i++)
	{
		for(int j = 0 ; j < c; j++)
		{
			outFile << graph_int[i][j] << " ";
		}

		outFile << "\n";
	}

	ofstream nodeFile;

	nodeFile.open("nodes.txt");	

	for(int i =0; i < numberNodes; i++)
	{
	int x = nodes[i].getX();
	    int y = nodes[i].getY();
	    nodeFile << x << " " << y << "\n";

	}

	nodeFile.close();

}

