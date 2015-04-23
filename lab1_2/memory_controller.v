module datapath(
    input logic op,
    input logic clk,
	 input logic [7:0] data_in,
    output logic [7:0] data_out);

genvar counter;

//Instatiantig memories
logic address; //For 1-entry memories

//Distance memory -- 32 parallel blocks -- Stores distance from all nodes to origin
logic wenable_dist[31:0];
logic [7:0] in_dist[31:0];
logic [7:0] out_dist[31:0];

generate
        for(counter = 0; counter < 32; counter = counter + 1) begin : dist_gen
        begin
            memory memory_8b_1entry(.clk(clk),.write(wenable_dist[counter]),.in(in_dist[counter]),.out(out_dist[counter]),.*);
        end
    end
endgenerate
    
//Prev memory -- 1 block with 32 lines -- each line represent one node
logic [4:0] prev_address;
logic [7:0] in_prev;
logic [7:0] out_prev;
logic wenable_prev;

memory_8b_32entry prev(.clk(clk),.address(prev_address),.data_in(in_prev),.write_enable(wenable_prev),.data_out(out_prev));

//Q memory -- Array of 32 registers -- Stores 0 for unvisited; 1 for visited
logic Q [31:0];

//Graph memory -- 4blocks of 32 lines - Stores INDEX + length
logic [4:0] graph_address [3:0];
logic [7:0] in_graph [3:0];
logic [7:0] out_graph [3:0];
logic wenable_graph [3:0];

memory_8b_32entry graph0(.clk(clk),.address(graph_address[0]),.data_in(in_graph[0]),.write_enable(wenable_graph[0]),.data_out(out_graph[0]));
memory_8b_32entry graph1(.clk(clk),.address(graph_address[1]),.data_in(in_graph[1]),.write_enable(wenable_graph[1]),.data_out(out_graph[1]));
memory_8b_32entry graph2(.clk(clk),.address(graph_address[2]),.data_in(in_graph[2]),.write_enable(wenable_graph[2]),.data_out(out_graph[2]));
memory_8b_32entry graph3(.clk(clk),.address(graph_address[3]),.data_in(in_graph[3]),.write_enable(wenable_graph[3]),.data_out(out_graph[3]));
	 
always_comb
begin
	if (op == 1) //Initialization phase
		begin
			Q <= 32'b0; 			
			wenable_graph [0] = 1;
			wenable_graph [1] = 1;
			wenable_graph [2] = 1;
			wenable_graph [3] = 1;
			
			graph_address [0] = count;
			in_graph [0] = (node_index_graph0 << 7) + (node_distance_graph0);
			
			graph_address [1] <= count;
			in_graph [1] = (node_index_graph1 << 7) + (node_distance_graph1);
			
			graph_address [2] <= count;
			in_graph [2] = (node_index_graph2 << 7) + (node_distance_graph2);
			
			graph_address [3] <= count;
			in_graph [3] = (node_index_graph3 << 7) + (node_distance_graph3);
			
		end
	else
		begin //Idle
			wenable_dist = 0;
			wenable_graph = 0;
			wenable_prev = 0;
			Q = Q;
		end
end

logic count;
logic [4:0] node_index_graph0;
logic [4:0] node_index_graph1;
logic [4:0] node_index_graph2;
logic [4:0] node_index_graph3;
logic [2:0] node_distance_graph0;
logic [2:0] node_distance_graph1;
logic [2:0] node_distance_graph2;
logic [2:0] node_distance_graph3;


//HARD-CODING A MAZE : MUST RECEIVE FROM SOFTWARE!!
always_ff @(posedge clk)
begin
	case (count)
		0 :
			begin
				node_index_graph0 <= 5'd1;
				node_distance_graph0 <= 3'd4;
				count <= count + 1;
			end
		1 :
			begin
				node_index_graph0 <= 5'd0;
				node_distance_graph0 <= 3'd4;
				node_index_graph1 <= 5'd2;
				node_distance_graph1 <= 3'd1;
				count <= count + 1;
			end
		2 :
			begin
				node_index_graph0 <= 5'd1;
				node_distance_graph0 <= 3'd1;
				node_index_graph1 <= 5'd5;
				node_distance_graph1 <= 3'd1;
				node_index_graph2 <= 5'd3;
				node_distance_graph2 <= 3'd2;
				count <= count + 1;
			end
		3 :
			begin
				node_index_graph0 <= 5'd2;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd4;
				node_distance_graph1 <= 3'd2;
				node_index_graph2 <= 5'd6;
				node_distance_graph2 <= 3'd3;
				count <= count + 1;
			end	
		4 :
			begin
				node_index_graph0 <= 5'd3;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd14;
				node_distance_graph1 <= 3'd6;
				count <= count + 1;
			end	
		5 :
			begin
				node_index_graph0 <= 5'd2;
				node_distance_graph0 <= 3'd1;
				node_index_graph1 <= 5'd8;
				node_distance_graph1 <= 3'd2;
				node_index_graph2 <= 5'd7;
				node_distance_graph2 <= 3'd2;
				count <= count + 1;
			end
		6 :
			begin
				node_index_graph0 <= 5'd3;
				node_distance_graph0 <= 3'd3;
				node_index_graph1 <= 5'd7;
				node_distance_graph1 <= 3'd2;
				node_index_graph2 <= 5'd13;
				node_distance_graph2 <= 3'd3;
				count <= count + 1;
			end
		7 :
			begin
				node_index_graph0 <= 5'd5;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd6;
				node_distance_graph1 <= 3'd2;
				node_index_graph2 <= 5'd12;
				node_distance_graph2 <= 3'd3;
				count <= count + 1;
			end
		8 :
			begin
				node_index_graph0 <= 5'd5;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd9;
				node_distance_graph1 <= 3'd2;
				count <= count + 1;
			end	
		9 :
			begin
				node_index_graph0 <= 5'd8;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd10;
				node_distance_graph1 <= 3'd1;
				count <= count + 1;
			end	
		10 :
			begin
				node_index_graph0 <= 5'd9;
				node_distance_graph0 <= 3'd1;
				node_index_graph1 <= 5'd11;
				node_distance_graph1 <= 3'd3;
				count <= count + 1;
			end	
		11 :
			begin
				node_index_graph0 <= 5'd10;
				node_distance_graph0 <= 3'd3;
				node_index_graph1 <= 5'd12;
				node_distance_graph1 <= 3'd3;
				count <= count + 1;
			end
		12 :
			begin
				node_index_graph0 <= 5'd11;
				node_distance_graph0 <= 3'd3;
				node_index_graph1 <= 5'd7;
				node_distance_graph1 <= 3'd3;
				node_index_graph2 <= 5'd13;
				node_distance_graph2 <= 3'd2;
				count <= count + 1;
			end
		13 :
			begin
				node_index_graph0 <= 5'd12;
				node_distance_graph0 <= 3'd2;
				node_index_graph1 <= 5'd6;
				node_distance_graph1 <= 3'd3;
				count <= count + 1;
			end	
		14 :
			begin
				node_index_graph0 <= 5'd4;
				node_distance_graph0 <= 3'd6;
				node_index_graph1 <= 5'd15;
				node_distance_graph1 <= 3'd1;
				count <= count + 1;
			end	
		15 :
			begin
				node_index_graph0 <= 5'd14;
				node_distance_graph0 <= 3'd1;
				count <= count + 1;
			end
		
		default : count <= 32;	
	
	endcase
end

endmodule

