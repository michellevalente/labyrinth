#include <vector>

using namespace std;

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
            return this->x;
      }

      int getY()
      {
            return this->y;
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

class Graph {
private:
      int** adjMatrix;                // Adjacency Matrix
      int numV;                       // Number of vertices
      vector<Node> nodes;
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
 
      ~Graph() {
            for (int i = 0; i < numV; i++)
                  delete[] adjMatrix[i];
            delete[] adjMatrix;
      }
};
