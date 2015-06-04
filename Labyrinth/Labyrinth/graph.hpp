
#include <vector>
#include <iostream>

using namespace std;

const int r = 11;
const int c = 11;

class Node{
private:
      int x;
      int y;
      int index;
public:
      Node(int x, int y, int index)
      {
            this->x = x;
            this->y = y;
            this->index = index;
      }

      int getX()
      {
            return x;
      }

      int getY()
      {
            return y;
      }

      int getIndex()
      {
            return this->index;
      }

      void showInfo()
      {
            cout << "index: " << index << endl;
            cout << "x: " << x << endl;
            cout << "y: " << y << endl;
      }

};
vector<Node> nodes;

class Graph {
private:
      int** adjMatrix;                // Adjacency Matrix
      int numV;                       // Number of vertices
      //vector<Node> nodes;
public:
      Graph(int V) {
            numV = V;
            adjMatrix = new int*[numV];
            for (int i = 0; i < numV; i++) {
                  adjMatrix[i] = new int[numV];
                  for (int j = 0; j < numV; j++)
                        adjMatrix[i][j] = 0;
            }
      }
 
      void addEdge(int i, int j, int distance) {
            if (i >= 0 && i < numV && j > 0 && j < numV) {
                  adjMatrix[i][j] = distance;
                  adjMatrix[j][i] = distance;
            }
      }
 
      void removeEdge(int i, int j) {
            if (i >= 0 && i < numV && j > 0 && j < numV) {
                  adjMatrix[i][j] = 0;
                  adjMatrix[j][i] = 0;
            }
      }
 
      int valueEdge(int i, int j) {
            if (i >= 0 && i < numV && j > 0 && j < numV)
                  return adjMatrix[i][j];
            else
                  return 0;
      }

      void addNode(int x, int y, int index)
      {
            Node newNode(x,y,index);
            nodes.push_back(newNode);
      }

      void showMatrix()
      {
            for(int i = 0; i < numV ; i++)
            {
                  for(int j = 0; j < numV; j++)
                  {
                        cout << " " << adjMatrix[i][j] ;
                  }
                  cout << "\n" ;
            }
      }

      int numberNodes()
      {
            return numV;
      }

      unsigned int ** getNeighbors()
      {
            unsigned int ** neighbors = 0;
            unsigned int ** neighbors32 =0;
            neighbors32 = new unsigned int*[numV];
            neighbors = new unsigned int*[numV];
            int numNeighbor = 0;
            for(int i = 0; i < numV ; i++)
            {
                  neighbors[i] = new unsigned int[4];
		  neighbors32[i] = new unsigned int[2];
                  for(int j = 0; j < numV; j++)
                  {
                        int bin_index = j * 64;
                        if(adjMatrix[i][j] != 0)
                        {
                              int bin_value = adjMatrix[i][j] + bin_index;
                              neighbors[i][numNeighbor] = bin_value;
                              numNeighbor++;
                        }
                  }
                  // If doesnt have 4 nodes, complete with itself.
                  if(numNeighbor != 4)
                  {    
                        for(int w = numNeighbor; w < 4 ; w++)
                              neighbors[i][w] = i * 64;
                  }

                  neighbors32[i][0] = neighbors[i][0] + (32768 * neighbors[i][1]); 
                  neighbors32[i][1] = neighbors[i][2] + (32768 * neighbors[i][3]);
		  neighbors32[i][1] = 1073741824 + neighbors32[i][1];
                  numNeighbor = 0;
            }

            return neighbors32;
      }

      void showNeighbor(int node_num)
      {
            Node node = nodes[node_num];
            string x = to_string(node.getX());
            string y = to_string(node.getY());
            cout << "Neighbors node " << node_num  << "( " << x << "," << y << " )" << ": ";
            for(int i =0 ; i < numV; i++)
            {
                  if(adjMatrix[node_num][i] != 0)
                        cout << i << ", ";
            }

            cout << "\n";
      }

      void showAllNeighbors()
      {
            for(int i =0 ; i < numV; i++)
            {
                  showNeighbor(i);
            }
      }

      vector<Node> getNodes()
      {
            return nodes;
      }

      int ** getGraph()
      {
            return adjMatrix;
      }

            
      ~Graph() {
            for (int i = 0; i < numV; i++)
                  delete[] adjMatrix[i];
            delete[] adjMatrix;
      }

};

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
                        if(isCorner(maze, x1, temp) && temp != y2 && temp != y1)
                              return 0;
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
                        if(isCorner(maze, x1, temp) && temp != y1 && temp!= y2)
                              return 0;
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
                        if(isCorner(maze, temp, y1) && temp != x2 && temp != x1)
                              return 0;
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
                        if(isCorner(maze, temp, y1) && temp != x1 && temp != x2)
                              return 0;
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

            for(int j = 0; j < nodes.size(); j++)
            {
                  if(j != i)
                  {
                        Node temp2 = nodes[j];
                        edge = isConnected(temp1,temp2, maze);

                        if(edge != 0)
                        {
                              g.addEdge(temp1.getIndex() - 1, temp2.getIndex() - 1, edge );
                        }
                  }
            }

      }

      return g;
}
