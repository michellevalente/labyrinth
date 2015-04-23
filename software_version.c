#include <stdio.h>
#include <stdbool.h>

int num_nodes = 16; 

void printPath(int destination, int prev_vertex[])
{
	if(prev_vertex[destination] != num_nodes)
	{
		printPath(prev_vertex[destination], prev_vertex);
		printf("->");
	}
	printf(" %d ", destination);
}

int comparator (int D[32]){	
	int results0[16];
	int index0[16];
	int results1[8];
	int index1[8];
	int results2[4];
	int index2[4];
	int results3[2];
	int index3[2];
	int results4;
	int index4;
	int i;

//First level comparison
	for (i = 0; i<32; i = i + 2){
		if (D[i] < D[i+1]){	
			results0[i/2] = D[i];
			index0[i/2] = i;
		}		
		else{	
			results0[i/2] = D[i+1];
			index0[i/2] = i+1;
		}
	}	

//Second level comparison
	for (i = 0; i<16; i = i + 2){
		if (results0[i] < results0[i+1]){		
			results1[i/2] = results0[i];
			index1[i/2] = index0[i];
		}		
		else{
			results1[i/2] = results0[i+1];
			index1[i/2] = index0[i + 1];
		}
	}	

// Third level comparison
	for (i = 0; i<8; i = i + 2){
		if (results1[i] < results1[i+1]){		
			results2[i/2] = results1[i];
			index2[i/2] = index1[i];
		}		
		else{
			results2[i/2] = results1[i+1];
			index2[i/2] = index1[i + 1];
		}
	}	

// Third level comparison

	for (i = 0; i<4; i = i + 2){
		if (results2[i] < results2[i+1]){		
			results3[i/2] = results2[i];
			index3[i/2] = index2[i];
		}		
		else{
			results3[i/2] = results2[i+1];
			index3[i/2] = index2[i + 1];
		}	
	}

// Fourth level comparison
	if (results3[0] < results3[1]){		
		results4 = results3[0];
		index4 = index3[0];
	}
	else{
		results4 = results3[1];
		index4 = index3[1];
	}
	

	
	return index4;
}

int main(){
//Graph memory -- 4blocks of 32 lines - Stores INDEX + length
	int graph0[32][2];
	int graph1[32][2];	
	int graph2[32][2];
	int graph3[32][2];
//Q memory -- Array of 32 FF's -- Stores 0 for unvisited; 1 for visited
	int Q[32];

//Prev temp -- 4 signals -- Inform wether best path should be updated with current node address
	bool prev0 = false;
	bool prev1 = false;
	bool prev2 = false;
	bool prev3 = false;

//Distance memory -- 32 parallel blocks -- Stores distance from all nodes to origin
	int distance[32];

//Prev memory -- 1 block with 32 lines -- each line represent one node
	int prev[32];

//Initializing memories
	int i;
	for (i = 0; i < num_nodes; i++){        
	        graph0[i][0] = i; 		
		graph1[i][0] = i;
		graph2[i][0] = i;
		graph3[i][0] = i;
		graph0[i][1] = 0; 		
		graph1[i][1] = 0;
		graph2[i][1] = 0;
		graph3[i][1] = 0;
		Q[i] = 0;
		prev[i] = num_nodes;
	}
	for (i = 0; i< 32; i++){
		distance[i] = 64;
	}
	distance[0] = 0;
	
//Sending graph information
	graph0[0][0] = 1; 		
	graph0[0][1] = 4;
	
	graph0[1][0] = 0; 		
	graph0[1][1] = 4;
	graph1[1][0] = 2; 		
	graph1[1][1] = 1;

	graph0[2][0] = 1; 		
	graph0[2][1] = 1;
	graph1[2][0] = 5; 		
	graph1[2][1] = 1;
	graph2[2][0] = 3; 		
	graph2[2][1] = 2; 		
	
	graph0[3][0] = 2; 		
	graph0[3][1] = 2;
	graph1[3][0] = 4; 		
	graph1[3][1] = 2;
	graph2[3][0] = 6; 		
	graph2[3][1] = 3;

	graph0[4][0] = 3; 		
	graph0[4][1] = 2;
	graph1[4][0] = 14; 		
	graph1[4][1] = 6;

	graph0[5][0] = 2; 		
	graph0[5][1] = 1;
	graph1[5][0] = 8; 		
	graph1[5][1] = 2;
	graph2[5][0] = 7; 		
	graph2[5][1] = 2;

	graph0[6][0] = 3; 		
	graph0[6][1] = 3;
	graph1[6][0] = 7; 		
	graph1[6][1] = 2;
	graph2[6][0] = 13; 		
	graph2[6][1] = 3; 		
	 		
	graph0[7][0] = 5; 		
	graph0[7][1] = 2;
	graph1[7][0] = 6; 		
	graph1[7][1] = 2;
	graph2[7][0] = 12; 		
	graph2[7][1] = 3; 		
	
	graph0[8][0] = 5; 		
	graph0[8][1] = 2;
	graph1[8][0] = 9; 		
	graph1[8][1] = 2;
	 		
	graph0[9][0] = 8; 		
	graph0[9][1] = 2;
	graph1[9][0] = 10; 		
	graph1[9][1] = 1;
	
	graph0[10][0] = 9; 		
	graph0[10][1] = 1;
	graph1[10][0] = 11; 		
	graph1[10][1] = 3;

	graph0[11][0] = 10; 		
	graph0[11][1] = 3;
	graph1[11][0] = 12; 		
	graph1[11][1] = 3;
	
	graph0[12][0] = 11; 		
	graph0[12][1] = 3;
	graph1[12][0] = 7; 		
	graph1[12][1] = 3;
	graph2[12][0] = 13; 		
	graph2[12][1] = 2; 		
			
	graph0[13][0] = 12; 		
	graph0[13][1] = 2;
	graph1[13][0] = 6; 		
	graph1[13][1] = 3;
	
	graph0[14][0] = 4; 		
	graph0[14][1] = 6;
	graph1[14][0] = 15; 		
	graph1[14][1] = 1;
	
	graph0[15][0] = 14; 		
	graph0[15][1] = 1;
	
//Starting operation

int u;
int v0_a;
int v1_a;
int v2_a;
int v3_a;
int v0_d;
int v1_d;
int v2_d;
int v3_d;

//PARALLEL OPERATION
	while (Q[15] == 0){
		u = comparator(distance);
		
		prev0 = false;
		prev1 = false;
		prev2 = false;
		prev3 = false;
//Check neighbor nodes
		v0_a = graph0[u][0];
		v1_a = graph1[u][0];
		v2_a = graph2[u][0];
		v3_a = graph3[u][0];
		v0_d = graph0[u][1];
		v1_d = graph1[u][1];
		v2_d = graph2[u][1];
		v3_d = graph3[u][1];

		if (Q[v0_a] == 0){
		
			if (distance[v0_a] > (distance[u] + v0_d)){
			
				distance[v0_a] = distance[u] + v0_d;
				prev[v0_a] = u;		
			}
		}

		if (Q[v1_a] == 0){
			if (distance[v1_a] > (distance[u] + v1_d)){
				distance[v1_a] = distance[u] + v1_d;
				prev[v1_a] = u;		
			}
		}
		
		if (Q[v2_a] == 0){
			if (distance[v2_a] > (distance[u] + v2_d)){
				distance[v2_a] = distance[u] + v2_d;				
				prev[v2_a] = u;		
			}
		}
	
			
		if (Q[v3_a] == 0){
			if (distance[v3_a] > (distance[u] + v3_d)){
				distance[v3_a] = distance[u] + v3_d;					
				prev[v3_a] = u;	
			}
		}
	
		distance[u] = 64;
		Q[u] = 1;
					
	}

//SEND PREV to software.
printPath(15, prev);
printf("\n");
return 0;

}
