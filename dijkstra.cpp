#include <stdio.h>
#include <limits.h>
#include <stdbool.h>
 
// Number of vertices 
int numV = 0;

// Calculate minimal distance
int minDistance(int dist[], bool visited[])
{
   int min_distance = INT_MAX; 
   int min_vertex;
 
   for (int i = 0; i < numV; i++)
     if (visited[i] == false && dist[i] <= min_distance)
     {
        min_vertex = i;
        min_distance = dist[i];
     }
         
 
   return min_vertex;
}

// Print best path
void printPath(int destination, int prev_vertex[])
{
  if(prev_vertex[destination] != -1)
  {
    printPath(prev_vertex[destination], prev_vertex);
    printf("->");
  }

  printf(" %d ", destination);
}

// Print distance of each vertex from source
void printDistance(int dist[], int n)
{
   printf("Vertex   Distance from Source\n");
   for (int i = 0; i < numV; i++)
      printf("%d \t\t %d\n", i, dist[i]);
}

// Dijkstra Algorithm
void dijkstra(int graph[numV][numV], int source, int destination)
{
     int dist[numV];     
     int prev_vertex[numV];
     for(int i = 0; i < numV; i++)
      prev_vertex[i] = -1;

     bool visited[numV]; 
 
     // Initialize all distances as maximum value
     // Initialize all nodes as not visited
     for (int i = 0; i < numV; i++)
     {
        dist[i] = INT_MAX;
        visited[i] = false;
     }
     // Initialize source distance to source as 0
     dist[source] = 0;
 
     for (int i = 0; i < numV-1; i++)
     {
       // Find the minimal distance to vertices not yet visited
       // and select vertex with minimal distance
       int selected_vertex = minDistance(dist, visited);
 
       // Mark the selected vertex as processed
       visited[selected_vertex] = true;
 
       // Get the distance to the adjacent vertices of selected vertex
       for (int j = 0; j < numV; j++)

        // Test if there is a edge from vertex(j) to selected_vertex
        // and test if vertex(j) has not been visited yet
        if(graph[selected_vertex][j] && !visited[j] && dist[selected_vertex] != INT_MAX)
        {
          int totalDistance = dist[selected_vertex] + graph[selected_vertex][j];

          // if totalDistance smaller than older distance update value
          if(totalDistance < dist[j])
          {
            dist[j] = totalDistance;
            prev_vertex[j] = selected_vertex;
          }
        }
     }
 
     // print the constructed distance array
     printDistance(dist, numV);
     printf("Best path:\n");
     printPath(destination,prev_vertex );
     printf("\n");
}

int main()
{
  numV = 9;
  int graph[9][9] = {{0, 4, 0, 0, 0, 0, 0, 8, 0},
                    {4, 0, 8, 0, 0, 0, 0, 11, 0},
                    {0, 8, 0, 7, 0, 4, 0, 0, 2},
                    {0, 0, 7, 0, 9, 14, 0, 0, 0},
                    {0, 0, 0, 9, 0, 10, 0, 0, 0},
                    {0, 0, 4, 0, 10, 0, 2, 0, 0},
                    {0, 0, 0, 14, 0, 2, 0, 1, 6},
                    {8, 11, 0, 0, 0, 0, 1, 0, 7},
                    {0, 0, 2, 0, 0, 0, 6, 7, 0}
                    };

  dijkstra(graph, 0,8);
  printf("\n\n");
  numV = 7;
  int graphNew[7][7] = {{0,1,0,0,0,0,0},
                     {1,0,3,6,0,0,0},
                     {0,3,0,0,0,1,0},
                     {0,6,0,0,1,0,0},
                     {0,0,0,1,0,0,2},
                     {0,0,1,0,0,0,1},
                     {0,0,0,0,2,1,0}
                    };

  dijkstra(graphNew, 0,6);
  return 0;
}