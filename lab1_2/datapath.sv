module datapath(
    input logic op,
    input logic clk,
	 input logic [3:0] KEY, //TO DELETE: ONLY TO CHECK DATA
	 input logic [3:0] SW, //TO DELETE: ONLY TO CHECK DATA
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
            memory_8b_1entry dist_mem(.clk(clk),.write(wenable_dist[counter]),.in(in_dist[counter]),.out(out_dist[counter]),.address(address));
        end
    end
endgenerate
    
//Prev memory -- 1 block with 32 lines -- each line represent one node
logic [4:0] prev_address;
logic [7:0] in_prev;
logic [7:0] out_prev;
logic wenable_prev;

memory_8b_32entryWiz prev(.clock(clk),.address(prev_address),.data(in_prev),.wren(wenable_prev),.q(out_prev));

//Q memory -- Array of 32 registers -- Stores 0 for unvisited; 1 for visited
logic [31:0] Q;

//Graph memory -- 4blocks of 32 lines - Stores INDEX + length
logic [4:0] graph_address [3:0];
logic [7:0] in_graph [3:0];
logic [7:0] out_graph [3:0];
logic wenable_graph [3:0];

memory_8b_32entryWiz graph0(.clock(clk),.address(graph_address[0]),.data(in_graph[0]),.wren(wenable_graph[0]),.q(out_graph[0]));
memory_8b_32entryWiz graph1(.clock(clk),.address(graph_address[1]),.data(in_graph[1]),.wren(wenable_graph[1]),.q(out_graph[1]));
memory_8b_32entryWiz graph2(.clock(clk),.address(graph_address[2]),.data(in_graph[2]),.wren(wenable_graph[2]),.q(out_graph[2]));
memory_8b_32entryWiz graph3(.clock(clk),.address(graph_address[3]),.data(in_graph[3]),.wren(wenable_graph[3]),.q(out_graph[3]));

//logic [10:0] in_0 = (5'd0 << 6) + out_dist[0][5:0];
//logic [10:0] in_1 = (5'd1 << 6) + out_dist[1][5:0];
//logic [10:0] in_2 = (5'd2 << 6) + out_dist[2][5:0];
//logic [10:0] in_3 = (5'd3 << 6) + out_dist[3][5:0];
//logic [10:0] in_4 = (5'd4 << 6) + out_dist[4][5:0];
//logic [10:0] in_5 = (5'd5 << 6) + out_dist[5][5:0];
//logic [10:0] in_6 = (5'd6 << 6) + out_dist[6][5:0];
//logic [10:0] in_7 = (5'd7 << 6) + out_dist[7][5:0];
//logic [10:0] in_8 = (5'd8 << 6) + out_dist[8][5:0];
//logic [10:0] in_9 = (5'd9 << 6) + out_dist[9][5:0];
//logic [10:0] in_10 = (5'd10 << 6) + out_dist[10][5:0];
//logic [10:0] in_11 = (5'd11 << 6) + out_dist[11][5:0];
//logic [10:0] in_12 = (5'd12 << 6) + out_dist[12][5:0];
//logic [10:0] in_13 = (5'd13 << 6) + out_dist[13][5:0];
//logic [10:0] in_14 = (5'd14 << 6) + out_dist[14][5:0];
//logic [10:0] in_15 = (5'd15 << 6) + out_dist[15][5:0];
//logic [10:0] in_16 = (5'd16 << 6) + out_dist[16][5:0];
//logic [10:0] in_17 = (5'd17 << 6) + out_dist[17][5:0];
//logic [10:0] in_18 = (5'd18 << 6) + out_dist[18][5:0];
//logic [10:0] in_19 = (5'd19 << 6) + out_dist[19][5:0];
//logic [10:0] in_20 = (5'd20 << 6) + out_dist[20][5:0];
//logic [10:0] in_21 = (5'd21 << 6) + out_dist[21][5:0];
//logic [10:0] in_22 = (5'd22 << 6) + out_dist[22][5:0];
//logic [10:0] in_23 = (5'd23 << 6) + out_dist[23][5:0];
//logic [10:0] in_24 = (5'd24 << 6) + out_dist[24][5:0];
//logic [10:0] in_25 = (5'd25 << 6) + out_dist[25][5:0];
//logic [10:0] in_26 = (5'd26 << 6) + out_dist[26][5:0];
//logic [10:0] in_27 = (5'd27 << 6) + out_dist[27][5:0];
//logic [10:0] in_28 = (5'd28 << 6) + out_dist[28][5:0];
//logic [10:0] in_29 = (5'd29 << 6) + out_dist[29][5:0];
//logic [10:0] in_30 = (5'd30 << 6) + out_dist[30][5:0];
//logic [10:0] in_31 = (5'd31 << 6) + out_dist[31][5:0];
//
//logic [10:0] out_1;
//
//logic [4:0] u = [10:6] out_1;
//logic [4:0] v0_ad;
//logic	[4:0]	v1_ad;
//logic	[4:0]	v2_ad;
//logic	[4:0]	v3_ad;
//logic	[2:0]	v0_dis;
//logic	[2:0]	v1_dis;
//logic	[2:0]	v2_dis;
//logic	[2:0]	v3_dis;


//comp_1 comparator(.*);

always_comb
begin
	if (op == 1'd1) //Initialization phase
		begin
			data_out = 8'b00000000;
			wenable_graph [0] = 1;
			wenable_graph [1] = 1;
			wenable_graph [2] = 1;
			wenable_graph [3] = 1;
					
			graph_address[0] = index;
			in_graph[0] = (node_index_graph0 << 3) + (node_distance_graph0);
			
			graph_address[1] = index;
			in_graph[1] = (node_index_graph1 << 3) + (node_distance_graph1);
			
			graph_address[2] = index;
			in_graph[2] = (node_index_graph2 << 3) + (node_distance_graph2);
			
			graph_address[3] = index;
			in_graph[3] = (node_index_graph3 << 3) + (node_distance_graph3);
			
			Q = 32'b0;
			
			wenable_dist[0] = 1'b1;
			wenable_dist[1] = 1'b1;
			wenable_dist[2] = 1'b1;
			wenable_dist[3] = 1'b1;
			wenable_dist[4] = 1'b1;
			wenable_dist[5] = 1'b1;
			wenable_dist[6] = 1'b1;
			wenable_dist[7] = 1'b1;
			wenable_dist[8] = 1'b1;
			wenable_dist[9] = 1'b1;
			wenable_dist[10] = 1'b1;
			wenable_dist[11] = 1'b1;
			wenable_dist[12] = 1'b1;
			wenable_dist[13] = 1'b1;
			wenable_dist[14] = 1'b1;
			wenable_dist[15] = 1'b1;
			wenable_dist[16] = 1'b1;
			wenable_dist[17] = 1'b1;
			wenable_dist[18] = 1'b1;
			wenable_dist[19] = 1'b1;
			wenable_dist[20] = 1'b1;
			wenable_dist[21] = 1'b1;
			wenable_dist[22] = 1'b1;
			wenable_dist[23] = 1'b1;
			wenable_dist[24] = 1'b1;
			wenable_dist[25] = 1'b1;
			wenable_dist[26] = 1'b1;
			wenable_dist[27] = 1'b1;
			wenable_dist[28] = 1'b1;
			wenable_dist[29] = 1'b1;
			wenable_dist[30] = 1'b1;
			wenable_dist[31] = 1'b1;
			
			in_dist[0] = 8'b0;
			in_dist[1] = 8'b11111111;
			in_dist[2] = 8'b11111111;
			in_dist[3] = 8'b11111111;
			in_dist[4] = 8'b11111111;
			in_dist[5] = 8'b11111111;
			in_dist[6] = 8'b11111111;
			in_dist[7] = 8'b11111111;
			in_dist[8] = 8'b11111111;
			in_dist[9] = 8'b11111111;
			in_dist[10] = 8'b11111111;
			in_dist[11] = 8'b11111111;
			in_dist[12] = 8'b11111111;
			in_dist[13] = 8'b11111111;
			in_dist[14] = 8'b11111111;
			in_dist[15] = 8'b11111111;
			in_dist[16] = 8'b11111111;
			in_dist[17] = 8'b11111111;
			in_dist[18] = 8'b11111111;
			in_dist[19] = 8'b11111111;
			in_dist[20] = 8'b11111111;
			in_dist[21] = 8'b11111111;
			in_dist[22] = 8'b11111111;
			in_dist[23] = 8'b11111111;
			in_dist[24] = 8'b11111111;
			in_dist[25] = 8'b11111111;
			in_dist[26] = 8'b11111111;
			in_dist[27] = 8'b11111111;
			in_dist[28] = 8'b11111111;
			in_dist[29] = 8'b11111111;
			in_dist[30] = 8'b11111111;
			in_dist[31] = 8'b11111111;	
						
		end
//	else if (op == 2'd2)
//		begin		
//			graph_address[0] = u;
//			graph_address[1] = u;
//			graph_address[2] = u;
//			graph_address[3] = u;
//			
//			v0_ad = out_graph[0][7:3];
//			v1_ad = out_graph[1][7:3];
//			v2_ad = out_graph[2][7:3];
//			v3_ad = out_graph[3][7:3];
//			v0_dis = out_graph[0][2:0];
//			v1_dis = out_graph[1][2:0];
//			v2_dis = out_graph[2][2:0];
//			v3_dis = out_graph[3][2:0];
//			
//			if (Q[v0_ad] == 1'b0)
//				begin
//					if (out_dist[v0_ad] > out_dist[u] + v0_dis)
//						begin
//							
//						end
//				end	
//		end	
	else  //Idle
		begin
			
			wenable_graph [0] = 0;
			wenable_graph [1] = 0;
			wenable_graph [2] = 0;
			wenable_graph [3] = 0;
			
			wenable_dist[0] = 1'b0;
			wenable_dist[1] = 1'b0;
			wenable_dist[2] = 1'b0;
			wenable_dist[3] = 1'b0;
			wenable_dist[4] = 1'b0;
			wenable_dist[5] = 1'b0;
			wenable_dist[6] = 1'b0;
			wenable_dist[7] = 1'b0;
			wenable_dist[8] = 1'b0;
			wenable_dist[9] = 1'b0;
			wenable_dist[10] = 1'b0;
			wenable_dist[11] = 1'b0;
			wenable_dist[12] = 1'b0;
			wenable_dist[13] = 1'b0;
			wenable_dist[14] = 1'b0;
			wenable_dist[15] = 1'b0;
			wenable_dist[16] = 1'b0;
			wenable_dist[17] = 1'b0;
			wenable_dist[18] = 1'b0;
			wenable_dist[19] = 1'b0;
			wenable_dist[20] = 1'b0;
			wenable_dist[21] = 1'b0;
			wenable_dist[22] = 1'b0;
			wenable_dist[23] = 1'b0;
			wenable_dist[24] = 1'b0;
			wenable_dist[25] = 1'b0;
			wenable_dist[26] = 1'b0;
			wenable_dist[27] = 1'b0;
			wenable_dist[28] = 1'b0;
			wenable_dist[29] = 1'b0;
			wenable_dist[30] = 1'b0;
			wenable_dist[31] = 1'b0;

			//OTHERWISE IT DOESN'T COMPILE. DOESNT MATTER, SINCE ITS NOT WRITING
			in_dist[0] = 8'b0;
			in_dist[1] = 8'b11111111;
			in_dist[2] = 8'b11111111;
			in_dist[3] = 8'b11111111;
			in_dist[4] = 8'b11111111;
			in_dist[5] = 8'b11111111;
			in_dist[6] = 8'b11111111;
			in_dist[7] = 8'b11111111;
			in_dist[8] = 8'b11111111;
			in_dist[9] = 8'b11111111;
			in_dist[10] = 8'b11111111;
			in_dist[11] = 8'b11111111;
			in_dist[12] = 8'b11111111;
			in_dist[13] = 8'b11111111;
			in_dist[14] = 8'b11111111;
			in_dist[15] = 8'b11111111;
			in_dist[16] = 8'b11111111;
			in_dist[17] = 8'b11111111;
			in_dist[18] = 8'b11111111;
			in_dist[19] = 8'b11111111;
			in_dist[20] = 8'b11111111;
			in_dist[21] = 8'b11111111;
			in_dist[22] = 8'b11111111;
			in_dist[23] = 8'b11111111;
			in_dist[24] = 8'b11111111;
			in_dist[25] = 8'b11111111;
			in_dist[26] = 8'b11111111;
			in_dist[27] = 8'b11111111;
			in_dist[28] = 8'b11111111;
			in_dist[29] = 8'b11111111;
			in_dist[30] = 8'b11111111;
			in_dist[31] = 8'b11111111;
			
			
			// ONLY TO CHECK. DELETE!!
			graph_address[0] = SW;
			graph_address[1] = SW;
			graph_address[2] = SW;
			graph_address[3] = SW;
			
			if 	(KEY [3] == 0)
				data_out = out_graph[0];
			else if 	(KEY [2] == 0)
				data_out = out_graph[1];
			else if 	(KEY [1] == 0)
				data_out = out_graph[2];
			else if 	(KEY [0] == 0)
				data_out = out_graph[3];			
			else
				data_out = 8'b11111111;
			
		end
end

logic [4:0] node_index_graph0;
logic [4:0] node_index_graph1;
logic [4:0] node_index_graph2;
logic [4:0] node_index_graph3;
logic [2:0] node_distance_graph0;
logic [2:0] node_distance_graph1;
logic [2:0] node_distance_graph2;
logic [2:0] node_distance_graph3;

//HARD-CODING A MAZE : MUST RECEIVE FROM SOFTWARE!!
logic [7:0] count;
logic [4:0] index;

always_ff @(posedge clk)
begin
	if (op == 1'd1)
	begin
		if (count < 1)
			begin
					node_index_graph0 <= 5'd1;
					node_distance_graph0 <= 3'd4;					
					node_index_graph1 <= 5'd0;
					node_distance_graph1 <= 3'd0;	
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd0;
				end
			else if (count > 0 & count < 2)
				begin
					node_index_graph0 <= 5'd0;
					node_distance_graph0 <= 3'd4;
					node_index_graph1 <= 5'd2;
					node_distance_graph1 <= 3'd1;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;					
					index <= 5'd1;
				end
			else if (count > 1 & count < 3)	
				begin
					node_index_graph0 <= 5'd1;
					node_distance_graph0 <= 3'd1;
					node_index_graph1 <= 5'd5;
					node_distance_graph1 <= 3'd1;
					node_index_graph2 <= 5'd3;
					node_distance_graph2 <= 3'd2;
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd2;
				end
			else if (count > 2 & count < 4)	
				begin
					node_index_graph0 <= 5'd2;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd4;
					node_distance_graph1 <= 3'd2;
					node_index_graph2 <= 5'd6;
					node_distance_graph2 <= 3'd3;
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd3;
				end
			else if (count > 3 & count < 5)	
					begin
					node_index_graph0 <= 5'd3;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd14;
					node_distance_graph1 <= 3'd6;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd4;
				end
			else if (count > 4 & count < 6)	
				begin
					node_index_graph0 <= 5'd2;
					node_distance_graph0 <= 3'd1;
					node_index_graph1 <= 5'd8;
					node_distance_graph1 <= 3'd2;
					node_index_graph2 <= 5'd7;
					node_distance_graph2 <= 3'd2;
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd5;
				end
			else if (count > 5 & count < 7)
				begin
					node_index_graph0 <= 5'd3;
					node_distance_graph0 <= 3'd3;
					node_index_graph1 <= 5'd7;
					node_distance_graph1 <= 3'd2;
					node_index_graph2 <= 5'd13;
					node_distance_graph2 <= 3'd3;
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd6;
				end
			else if (count > 6 & count < 8)
				begin
					node_index_graph0 <= 5'd5;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd6;
					node_distance_graph1 <= 3'd2;
					node_index_graph2 <= 5'd12;
					node_distance_graph2 <= 3'd3;					
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd7;
				end
			else if (count > 7 & count < 9)	
					begin
					node_index_graph0 <= 5'd5;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd9;
					node_distance_graph1 <= 3'd2;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd8;
				end	
			else if (count > 8 & count < 10)
				begin
					node_index_graph0 <= 5'd8;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd10;
					node_distance_graph1 <= 3'd1;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd9;
				end	
			else if (count > 9 & count < 11)	
				begin
					node_index_graph0 <= 5'd9;
					node_distance_graph0 <= 3'd1;
					node_index_graph1 <= 5'd11;
					node_distance_graph1 <= 3'd3;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd10;
				end	
			else if (count > 10 & count < 12)	
				begin
					node_index_graph0 <= 5'd10;
					node_distance_graph0 <= 3'd3;
					node_index_graph1 <= 5'd12;
					node_distance_graph1 <= 3'd3;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd11;
				end
			else if (count > 11 & count < 13)	
				begin
					node_index_graph0 <= 5'd11;
					node_distance_graph0 <= 3'd3;
					node_index_graph1 <= 5'd7;
					node_distance_graph1 <= 3'd3;
					node_index_graph2 <= 5'd13;
					node_distance_graph2 <= 3'd2;
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd12;
				end
			else if (count > 12 & count < 14)	
				begin
					node_index_graph0 <= 5'd12;
					node_distance_graph0 <= 3'd2;
					node_index_graph1 <= 5'd6;
					node_distance_graph1 <= 3'd3;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd13;
				end
			else if (count > 13 & count < 15)	
				begin
					node_index_graph0 <= 5'd4;
					node_distance_graph0 <= 3'd6;
					node_index_graph1 <= 5'd15;
					node_distance_graph1 <= 3'd1;
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd14;
				end	
			else if (count > 14 & count < 16)	
				begin
					node_index_graph0 <= 5'd14;
					node_distance_graph0 <= 3'd1;
					node_index_graph1 <= 5'd0;
					node_distance_graph1 <= 3'd0;	
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;	
					count <= count + 8'd1;
					index <= 5'd15;
				end
			else
				begin
					count <= 8'd16;
					node_index_graph0 <= 5'd14;
					node_distance_graph0 <= 3'd0;
					node_index_graph1 <= 5'd0;
					node_distance_graph1 <= 3'd0;	
					node_index_graph2 <= 5'd0;
					node_distance_graph2 <= 3'd0;	
					node_index_graph3 <= 5'd0;
					node_distance_graph3 <= 3'd0;				
				end
		end
end

endmodule

