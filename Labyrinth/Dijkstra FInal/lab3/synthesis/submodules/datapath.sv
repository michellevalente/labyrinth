module datapath(
	input logic clk,
	input logic [2:0] op,
	input logic [3:0]  KEY,
	input logic [3:0]  SW,
	input logic reset,
	input logic [31:0]  data_in,
	input logic  write,
	input        chipselect,
	output logic [31:0] data_out,
	output logic init_done,
	output logic update_done,
	output logic DONE,
	output logic idle_state);

//Distance Memory Parameters
logic [7:0] dist_data_1a, dist_data_1b, dist_data_2a, dist_data_2b;
logic [4:0] dist_addr_1a, dist_addr_1b, dist_addr_2a, dist_addr_2b;
logic [7:0] dist_read_1a, dist_read_1b, dist_read_2a, dist_read_2b;
logic dist_we_1a, dist_we_1b, dist_we_2a, dist_we_2b;

logic [4:0] prev_data_1a, prev_data_1b, prev_data_2a, prev_data_2b;
logic [4:0] prev_addr_1a, prev_addr_1b, prev_addr_2a, prev_addr_2b;
logic [4:0] prev_read_1a, prev_read_1b, prev_read_2a, prev_read_2b;
logic prev_we_1a, prev_we_1b, prev_we_2a, prev_we_2b;

logic visited_data_1a, visited_data_1b, visited_data_2a, visited_data_2b;
logic [4:0] visited_addr_1a, visited_addr_1b, visited_addr_2a, visited_addr_2b;
logic visited_read_1a, visited_read_1b, visited_read_2a, visited_read_2b;
logic visited_we_1a, visited_we_1b, visited_we_2a, visited_we_2b;

logic [10:0] graph_data_1a, graph_data_1b, graph_data_2a, graph_data_2b, graph_data_3a, graph_data_3b, graph_data_4a, graph_data_4b;
logic [4:0] graph_addr_1a, graph_addr_1b, graph_addr_2a, graph_addr_2b, graph_addr_3a, graph_addr_3b, graph_addr_4a, graph_addr_4b;
logic [10:0] graph_read_1a, graph_read_1b, graph_read_2a, graph_read_2b, graph_read_3a, graph_read_3b, graph_read_4a, graph_read_4b;
logic graph_we_1a, graph_we_1b, graph_we_2a, graph_we_2b, graph_we_3a, graph_we_3b, graph_we_4a, graph_we_4b;

distance_memory dist_1(.data_a(dist_data_1a),.data_b(dist_data_1b),.addr_a(dist_addr_1a),.addr_b(dist_addr_1b),.we_a(dist_we_1a),.we_b(dist_we_1b),.q_a(dist_read_1a),.q_b(dist_read_1b),.*);
distance_memory dist_2(.data_a(dist_data_2a),.data_b(dist_data_2b),.addr_a(dist_addr_2a),.addr_b(dist_addr_2b),.we_a(dist_we_2a),.we_b(dist_we_2b),.q_a(dist_read_2a),.q_b(dist_read_2b),.*);

previous_memory prev_1(.data_a(prev_data_1a),.data_b(prev_data_1b),.addr_a(prev_addr_1a),.addr_b(prev_addr_1b),.we_a(prev_we_1a),.we_b(prev_we_1b),.q_a(prev_read_1a),.q_b(prev_read_1b),.*);

previous_memory prev_2(.data_a(prev_data_2a),.data_b(prev_data_2b),.addr_a(prev_addr_2a),.addr_b(prev_addr_2b),.we_a(prev_we_2a),.we_b(prev_we_2b),.q_a(prev_read_2a),.q_b(prev_read_2b),.*);


visited_memory visited_1(.data_a(visited_data_1a),.data_b(visited_data_1b),.addr_a(visited_addr_1a),.addr_b(visited_addr_1b),.we_a(visited_we_1a),.we_b(visited_we_1b),.q_a(visited_read_1a),.q_b(visited_read_1b),.*);

visited_memory visited_2(.data_a(visited_data_2a),.data_b(visited_data_2b),.addr_a(visited_addr_2a),.addr_b(visited_addr_2b),.we_a(visited_we_2a),.we_b(visited_we_2b),.q_a(visited_read_2a),.q_b(visited_read_2b),.*);

graph_memory graph_1(.data_a(graph_data_1a),.data_b(graph_data_1b),.addr_a(graph_addr_1a),.addr_b(graph_addr_1b),.we_a(graph_we_1a),.we_b(graph_we_1b),.q_a(graph_read_1a),.q_b(graph_read_1b),.*);
graph_memory graph_2(.data_a(graph_data_2a),.data_b(graph_data_2b),.addr_a(graph_addr_2a),.addr_b(graph_addr_2b),.we_a(graph_we_2a),.we_b(graph_we_2b),.q_a(graph_read_2a),.q_b(graph_read_2b),.*);
graph_memory graph_3(.data_a(graph_data_3a),.data_b(graph_data_3b),.addr_a(graph_addr_3a),.addr_b(graph_addr_3b),.we_a(graph_we_3a),.we_b(graph_we_3b),.q_a(graph_read_3a),.q_b(graph_read_3b),.*);
graph_memory graph_4(.data_a(graph_data_4a),.data_b(graph_data_4b),.addr_a(graph_addr_4a),.addr_b(graph_addr_4b),.we_a(graph_we_4a),.we_b(graph_we_4b),.q_a(graph_read_4a),.q_b(graph_read_4b),.*);

comp_1 comparator (.in_0(comp_in1),.in_1(comp_in2),.in_2(comp_in3),.in_3(comp_in4),.out_1(comp_out));

/*----------------------Memory Initialization----------------------------*/

logic [5:0] counter;
logic phase;
logic [4:0] u;
logic [4:0] prev_u;
logic [7:0] dist_u;
logic init_done_0, init_done_1;

logic [10:0] comp_in1, comp_in2, comp_in3, comp_in4;
logic [10:0] comp_out; 

logic [5:0] num_nodes;
logic [5:0] corrected_num_nodes;
logic [4:0] next_address;
logic [4:0] next_path_address;

logic [2:0] done_count;

logic update_1,update_2;

assign init_done = init_done_0 & init_done_1;

logic [3:0] test;
logic path_check, path_check2;
logic prev_state;

logic [9:0] graph_counter;

logic [3:0] op_count;
logic [4:0] update_count;
logic [4:0] iter_count;
logic [3:0] update_vector;
logic [10:0] node_min;
logic [8:0] comp_count;
logic [8:0] start_count;
logic [8:0] comp_reg1, comp_reg2, comp_reg3, comp_reg4;
logic update_min;

assign test[0] = (graph_read_1a[0] | graph_read_1a[1] | graph_read_1a[2] 
					| graph_read_1a[3]  | graph_read_1a[4] | graph_read_1a[5]);
				
assign test[1] = (graph_read_2a[0] | graph_read_2a[1] | graph_read_2a[2] 
					| graph_read_2a[3]  | graph_read_2a[4] | graph_read_2a[5]);
			
assign test[2] = (graph_read_3a[0] | graph_read_3a[1] | graph_read_3a[2] 
					| graph_read_3a[3]  | graph_read_3a[4] | graph_read_3a[5]);

assign test[3] = (graph_read_4a[0] | graph_read_4a[1] | graph_read_4a[2] 
					| graph_read_4a[3]  | graph_read_4a[4] | graph_read_4a[5]);


	logic [5:0] counter_graph;
 
always_ff @(posedge clk)
begin	
	if(op == 3'd1) //Initialization
	begin
		DONE <= 1'b0;
		if (counter < 6'd32)
		begin
			if(phase == 1'b0)
			begin
				u <= 5'd0;
				dist_we_1a <= 1'b0;
				dist_we_2a <= 1'b0;
				visited_we_1a <= 1'b0;	
				visited_we_2a <= 1'b0;
				prev_we_1a <= 1'b0;
				prev_we_2a <= 1'b0;
				
				dist_addr_1a <= counter[4:0];
				dist_addr_2a <= counter[4:0];
				visited_addr_1a <= counter[4:0];		
				visited_addr_2a <= counter[4:0];	
				prev_addr_1a <= counter[4:0];
				prev_addr_2a <= counter[4:0];
				
				visited_data_1a <= 1'b0;	
				visited_data_2a <= 1'b0;
				prev_data_1a <= 1'b0;
				prev_data_2a <= 1'b0;				
				init_done_0 <= 1'd0;
				if(counter == 6'd0)
					begin
						dist_data_1a <= 8'b00000000;
						dist_data_2a <= 8'b00000000;					
					end	
				else
					begin
						dist_data_1a <= 8'b11111111;
						dist_data_2a <= 8'b11111111;
					end
				phase <= 1'b1;
			end
			else if (phase == 1'b1)
			begin
				dist_we_1a <= 1'b1;
				dist_we_2a <= 1'b1;
				visited_we_1a <= 1'b1;	
				visited_we_2a <= 1'b1;
				prev_we_1a <= 1'b1;		
				prev_we_2a <= 1'b1;	
				phase <= 1'b0;
				init_done_0 <= 1'd0;
				counter <= counter + 6'd1;
			end
		end
		else
		begin
			dist_we_1a <= 1'b0;
			dist_we_2a <= 1'b0;
			visited_we_1a <= 1'b0;		
			visited_we_2a <= 1'b0;
			prev_we_1a <= 1'b0;
			prev_we_2a <= 1'b0;			
			init_done_0 <= 1'd1;
			update_done <= 1'b0;
		end
		
		//reading num nodes
			if (chipselect && write && data_in[31])
			begin	
				num_nodes <= data_in[5:0];
				corrected_num_nodes <= data_in[5:0] - 6'd1;
			end
			else
				num_nodes <= num_nodes;
		
		//reading graph data
		
		if (graph_counter < 10'd32)
		begin			
			if (chipselect && write && !data_in[31] && !data_in[30])
				begin
					graph_data_1a <= data_in[10:0];
					graph_addr_1a <= graph_counter[4:0];
					
					graph_data_2a <= data_in[25:15];
					graph_addr_2a <= graph_counter[4:0];
					
					graph_we_1a <= 1'b0;
					graph_we_2a <= 1'b0;
					graph_we_3a <= 1'b1;
					graph_we_4a <= 1'b1;				
					init_done_1 <= 1'b0;
				end			
			else if (chipselect && write && !data_in[31] && data_in[30])
				begin
					graph_data_3a <= data_in[10:0];
					graph_addr_3a <= graph_counter[4:0];
					
					graph_data_4a <= data_in[25:15];
					graph_addr_4a <= graph_counter[4:0];
					
					graph_we_3a <= 1'b0;
					graph_we_4a <= 1'b0;
					graph_we_1a <= 1'b1;
					graph_we_2a <= 1'b1;
					init_done_1 <= 1'b0;
					graph_counter <= graph_counter + 10'd1;
				end
			else
				begin
					graph_data_1a <= graph_data_1a;
					graph_addr_1a <= graph_addr_1a;
					
					graph_data_2a <= graph_data_2a;
					graph_addr_2a <= graph_addr_2a;
					
					graph_data_3a <= graph_data_3a;
					graph_addr_3a <= graph_addr_3a;
					
					graph_data_4a <= graph_data_4a;
					graph_addr_4a <= graph_addr_4a;
					
					graph_we_1a <= graph_we_1a;
					graph_we_2a <= graph_we_2a;
					graph_we_3a <= graph_we_3a;
					graph_we_4a <= graph_we_4a;
					init_done_1 <= 1'b0;
				end	
		end
		else if (graph_counter == 10'd32)
		begin
			graph_we_1a <= 1'b0;
			graph_we_2a <= 1'b0;
			graph_we_3a <= 1'b1;
			graph_we_4a <= 1'b1;
			
			graph_data_3a <= graph_data_3a;
			graph_addr_3a <= graph_addr_3a;
					
			graph_data_4a <= graph_data_4a;
			graph_addr_4a <= graph_addr_4a;
			init_done_1 <= 1'b0;
			graph_counter <= graph_counter + 10'd1;
		end
		else
		begin
			init_done_1 <= 1'b1;
			
			graph_we_1a <= 1'b0;
			graph_we_2a <= 1'b0;
			graph_we_3a <= 1'b0;
			graph_we_4a <= 1'b0;
		end	
		
		
	end//----------------------------------------------------------------------------------------	
	
	
	
	
	else if(op == 3'd2) //--------------------UPDATE DISTANCE AND PREVIOUS
	begin//0
		if(u != corrected_num_nodes) 
		begin//check done
		if(update_count == 5'd0)
		begin//0a		----		Set u to visited
			node_min <= 11'd2047;
			u <= u;
			start_count <= 9'b0;
			comp_count <= 9'd0;
				
			visited_addr_1a <= u;
			visited_addr_2a <= u;
			
			//test
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			visited_data_1a <= 1'b1;
			visited_data_2a <= 1'b1;
						
			//fetch dist of u
			dist_addr_1a <= u;
		
			//enforcing
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			visited_we_1b <= 1'b0;
			visited_we_2b <= 1'b0;
			prev_we_1a <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2b <= 1'b0;
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
				
			update_count <= update_count + 5'd1;			
			
		end//0a
		else if(update_count == 5'd1)
		begin//0b	----		Set visited_we high to set u to visited
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
		
			visited_addr_1a <= u;
			visited_addr_2a <= u;
			
			visited_data_1a <= 1'b1;
			visited_data_2a <= 1'b1;
			
			visited_we_1a <= 1'b1;
			visited_we_2a <= 1'b1;
						
			//fetch dist of u
			dist_addr_1a <= u;
			dist_u <= dist_read_1a;
			
			//enforcing
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			visited_we_1b <= 1'b0;
			visited_we_2b <= 1'b0;
			prev_we_1a <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2b <= 1'b0;
			
			
		
			
			update_count <= update_count + 5'd1;
			
		end//0b
		
		
		else if(update_count == 5'd2)
		begin//0c
			visited_addr_1a <= u;
			visited_addr_2a <= u;
			
			visited_we_1a <= 1'b0;
			visited_we_2a <= 1'b0;	
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
				
		
			//fetch dist of u
			dist_addr_1a <= u;
			dist_u <= dist_read_1a;
		
			//enforcing
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			visited_we_1b <= 1'b0;
			visited_we_2b <= 1'b0;
			prev_we_1a <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2b <= 1'b0;

			
			update_count <= update_count + 5'd1;
			
		end//0c
		else if(update_count == 5'd3)
		begin//0d
			//fetch visited info about each neighbor
			visited_addr_1a <= graph_read_1a[10:6];
			visited_addr_1b <= graph_read_2a[10:6];
			visited_addr_2a <= graph_read_3a[10:6];
			visited_addr_2b <= graph_read_4a[10:6];
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_1a[10:6];
			prev_addr_1b <= graph_read_2a[10:6];
			prev_addr_2a <= graph_read_3a[10:6];
			prev_addr_2b <= graph_read_4a[10:6];
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
						
			update_count <= update_count + 5'd1;
		end//0d
		else if(update_count > 5'd3 && update_count < 5'd7)
		begin//0e
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
			
			//fetch visited info about each neighbor
			visited_addr_1a <= graph_read_1a[10:6];
			visited_addr_1b <= graph_read_2a[10:6];
			visited_addr_2a <= graph_read_3a[10:6];
			visited_addr_2b <= graph_read_4a[10:6];
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_1a[10:6];
			prev_addr_1b <= graph_read_2a[10:6];
			prev_addr_2a <= graph_read_3a[10:6];
			prev_addr_2b <= graph_read_4a[10:6];
			
			//update prev and dist of neighbors if they are not visited or if their distance is greather than dist(u)+path weight
			if((visited_read_1a == 1'b0) && (dist_read_1a > (dist_u + graph_read_1a[5:0])))
			begin
				update_vector[0] <= 1'b1;
			end
			else
			begin
				update_vector[0] <= 1'b0;
			end
			
			if((visited_read_1b == 1'b0) && (dist_read_1b > (dist_u + graph_read_2a[5:0])))
			begin
				update_vector[1] <= 1'b1;
			end
			else
			begin
				update_vector[1] <= 1'b0;
			end
			
			if((visited_read_2a == 1'b0) && (dist_read_2a > (dist_u + graph_read_3a[5:0])))
			begin
				update_vector[2] <= 1'b1;
			end
			else
			begin
				update_vector[2] <= 1'b0;
			end
			
			if((visited_read_2b == 1'b0) && (dist_read_2b > (dist_u + graph_read_4a[5:0])))
			begin
				update_vector[3] <= 1'b1;
			end
			else
			begin
				update_vector[3] <= 1'b0;
			end
			
//			if(iter_count == 5'd2)
//				update_count <= update_count;
//			else
//				update_count <= update_count + 5'd1;
			
			update_count <= update_count + 5'd1;
		end//0e
		else if(update_count == 5'd7)
		begin//0f
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
		
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_1a[10:6];
			prev_addr_1b <= graph_read_2a[10:6];
			prev_addr_2a <= graph_read_3a[10:6];
			prev_addr_2b <= graph_read_4a[10:6];
			
			//set write enables low
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;
			
			update_vector <= update_vector;
		
			if(update_vector[0] == 1'b1)
			begin
				dist_data_1a <= dist_u + graph_read_1a[5:0];
				prev_data_1a <= u;
			end
			else
			begin
				dist_data_1a <= dist_read_1a;
				prev_data_1a <= prev_read_1a;
			end
				
			if(update_vector[1] == 1'b1)
			begin
				dist_data_1b <= dist_u + graph_read_2a[5:0];
				prev_data_1b <= u;
			end
			else
			begin
				dist_data_1b <= dist_read_1b;
				prev_data_1b <= prev_read_1b;
			end
				
			if(update_vector[2] == 1'b1)
			begin
				dist_data_2a <= dist_u + graph_read_3a[5:0];
				prev_data_2a <= u;
			end
			else
			begin
				dist_data_2a <= dist_read_2a;	
				prev_data_2a <= prev_read_2a;
			end
				
			if(update_vector[3] == 1'b1)
			begin
				dist_data_2b <= dist_u + graph_read_4a[5:0];
				prev_data_2b <= u;
			end
			else
			begin
				dist_data_2b <= dist_read_2b;
				prev_data_2b <= prev_read_2b;
			end
				
			update_count <= update_count + 5'd1;
			//update_count <= update_count;	
				
		end//0f
		else if(update_count == 5'd8)
		begin//0g
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_1a[10:6];
			prev_addr_1b <= graph_read_2a[10:6];
			prev_addr_2a <= graph_read_3a[10:6];
			prev_addr_2b <= graph_read_4a[10:6];
			
			//set write enables high
			//dist_we_1a <= 1'b1;
			//dist_we_1b <= 1'b1;
			//dist_we_2a <= 1'b1;
			//dist_we_2b <= 1'b1;
			
			//prev_we_1a <= 1'b1;
			//prev_we_1b <= 1'b1;
			//prev_we_2a <= 1'b1;
			//prev_we_2b <= 1'b1;
			
			if(update_vector[0] == 1'b1)
			begin
				dist_data_1a <= dist_u + graph_read_1a[5:0];
				prev_data_1a <= u;
				prev_we_1a <= 1'b1;
				dist_we_1a <= 1'b1;
			end
			else
			begin
				dist_data_1a <= dist_read_1a;
				prev_data_1a <= prev_read_1a;
				prev_we_1a <= 1'b0;
				dist_we_1a <= 1'b0;
			end
				
			if(update_vector[1] == 1'b1)
			begin
				dist_data_1b <= dist_u + graph_read_2a[5:0];
				prev_data_1b <= u;
				prev_we_1b <= 1'b1;
				dist_we_1b <= 1'b1;
			end
			else
			begin
				dist_data_1b <= dist_read_1b;
				prev_data_1b <= prev_read_1b;
				prev_we_1b <= 1'b0;
				dist_we_1b <= 1'b0;
			end
				
			if(update_vector[2] == 1'b1)
			begin
				dist_data_2a <= dist_u + graph_read_3a[5:0];
				prev_data_2a <= u;
				prev_we_2a <= 1'b1;
				dist_we_2a <= 1'b1;
			end
			else
			begin
				dist_data_2a <= dist_read_2a;	
				prev_data_2a <= prev_read_2a;
				prev_we_2a <= 1'b0;
				dist_we_2a <= 1'b0;
			end
				
			if(update_vector[3] == 1'b1)
			begin
				dist_data_2b <= dist_u + graph_read_4a[5:0];
				prev_data_2b <= u;
				prev_we_2b <= 1'b1;				
				dist_we_2b <= 1'b1;
			end
			else
			begin
				dist_data_2b <= dist_read_2b;
				prev_data_2b <= prev_read_2b;
				prev_we_2b <= 1'b0;
				dist_we_2b <= 1'b0;
			end
				
			update_count <= update_count + 5'd1;
			
		end//0g
		else if(update_count == 5'd9)
		begin//0h
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
		
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_1a[10:6];
			prev_addr_1b <= graph_read_2a[10:6];
			prev_addr_2a <= graph_read_3a[10:6];
			prev_addr_2b <= graph_read_4a[10:6];
		
			//set write enables low
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;
			
			//***MIGHT WANT TO ENFORCE INPUTS TO PREV AND DATA
						
			update_count <= update_count + 5'd1;
		end//0h
		else if(update_count == 5'd10)
		begin//0i			update next 2 elements in array
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_3a[10:6];
			dist_addr_1b <= graph_read_4a[10:6];
			dist_addr_2a <= graph_read_1a[10:6];
			dist_addr_2b <= graph_read_2a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_3a[10:6];
			prev_addr_1b <= graph_read_4a[10:6];
			prev_addr_2a <= graph_read_1a[10:6];
			prev_addr_2b <= graph_read_2a[10:6];
			
			//set write enables low
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;
			
			update_count <= update_count + 5'd1;
						
		end//0i
		else if(update_count == 5'd11)
		begin//0j
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_3a[10:6];
			dist_addr_1b <= graph_read_4a[10:6];
			dist_addr_2a <= graph_read_1a[10:6];
			dist_addr_2b <= graph_read_2a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_3a[10:6];
			prev_addr_1b <= graph_read_4a[10:6];
			prev_addr_2a <= graph_read_1a[10:6];
			prev_addr_2b <= graph_read_2a[10:6];
			
			//set write enables low
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;
			
			if(update_vector[2] == 1'b1)
			begin
				dist_data_1a <= dist_u + graph_read_3a[5:0];
				prev_data_1a <= u;
			end
			else
			begin
				dist_data_1a <= dist_read_1a;
				prev_data_1a <= prev_read_1a;
			end
				
			if(update_vector[3] == 1'b1)
			begin
				dist_data_1b <= dist_u + graph_read_4a[5:0];
				prev_data_1b <= u;
			end
			else
			begin
				dist_data_1b <= dist_read_1b;
				prev_data_1b <= prev_read_1b;
			end
				
			if(update_vector[1] == 1'b1)
			begin
				dist_data_2a <= dist_u + graph_read_1a[5:0];
				prev_data_2a <= u;
			end
			else
			begin
				dist_data_2a <= dist_read_2a;	
				prev_data_2a <= prev_read_2a;
			end
				
			if(update_vector[2] == 1'b1)
			begin
				dist_data_2b <= dist_u + graph_read_2a[5:0];
				prev_data_2b <= u;
			end
			else
			begin
				dist_data_2b <= dist_read_2b;
				prev_data_2b <= prev_read_2b;
			end
			
			update_count <= update_count + 5'd1;
			
		end//0j
		else if(update_count == 5'd12)
		begin//0k
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
		
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_3a[10:6];
			dist_addr_1b <= graph_read_4a[10:6];
			dist_addr_2a <= graph_read_1a[10:6];
			dist_addr_2b <= graph_read_2a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_3a[10:6];
			prev_addr_1b <= graph_read_4a[10:6];
			prev_addr_2a <= graph_read_1a[10:6];
			prev_addr_2b <= graph_read_2a[10:6];
		
			//set write enables high
			//dist_we_1a <= 1'b1;
			//dist_we_1b <= 1'b1;
			//dist_we_2a <= 1'b1;
			//dist_we_2b <= 1'b1;
			
			//prev_we_1a <= 1'b1;
			//prev_we_1b <= 1'b1;
			//prev_we_2a <= 1'b1;
			//prev_we_2b <= 1'b1;
			
			if(update_vector[2] == 1'b1)
			begin
				dist_data_1a <= dist_u + graph_read_3a[5:0];
				prev_data_1a <= u;
				prev_we_1a <= 1'b1;
				dist_we_1a <= 1'b1;
			end
			else
			begin
				dist_data_1a <= dist_read_1a;
				prev_data_1a <= prev_read_1a;
				prev_we_1a <= 1'b0;
				dist_we_1a <= 1'b0;
			end
				
			if(update_vector[3] == 1'b1)
			begin
				dist_data_1b <= dist_u + graph_read_4a[5:0];
				prev_data_1b <= u;
				prev_we_1b <= 1'b1;
				dist_we_1b <= 1'b1;
			end
			else
			begin
				dist_data_1b <= dist_read_1b;
				prev_data_1b <= prev_read_1b;
				prev_we_1b <= 1'b0;
				dist_we_1b <= 1'b0;
			end
				
			if(update_vector[0] == 1'b1)
			begin
				dist_data_2a <= dist_u + graph_read_1a[5:0];
				prev_data_2a <= u;
				prev_we_2a <= 1'b1;
				dist_we_2a <= 1'b1;
			end
			else
			begin
				dist_data_2a <= dist_read_2a;	
				prev_data_2a <= prev_read_2a;
				prev_we_2a <= 1'b0;
				dist_we_2a <= 1'b0;
			end
				
			if(update_vector[1] == 1'b1)
			begin
				dist_data_2b <= dist_u + graph_read_2a[5:0];
				prev_data_2b <= u;
				prev_we_2b <= 1'b1;
				dist_we_2b <= 1'b1;
			end
			else
			begin
				dist_data_2b <= dist_read_2b;
				prev_data_2b <= prev_read_2b;
				prev_we_2b <= 1'b0;
				dist_we_2b <= 1'b0;
			end
			
			
			update_count <= update_count + 5'd1;
		end//0k
		else if(update_count == 5'd13)
		begin//0l
			
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_3a[10:6];
			dist_addr_1b <= graph_read_4a[10:6];
			dist_addr_2a <= graph_read_1a[10:6];
			dist_addr_2b <= graph_read_2a[10:6];
			
			//set prev address ready for writing
			prev_addr_1a <= graph_read_3a[10:6];
			prev_addr_1b <= graph_read_4a[10:6];
			prev_addr_2a <= graph_read_1a[10:6];
			prev_addr_2b <= graph_read_2a[10:6];
		
			//set write enables low
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;

			node_min <= 11'd2047;
			
			update_count <= update_count + 5'd1;
			
			comp_count <= 9'd0;
		
		end//0l
		else if(update_count == 5'd14)
		begin//0m
		
			comp_reg1 <= comp_count[4:0];
			comp_reg2 <= comp_count[4:0]+5'd1;
			comp_reg3 <= comp_count[4:0]+5'd2;
			comp_reg4 <= comp_count[4:0]+5'd3;
			
			//fetch visited info about each neighbor
			visited_addr_1a <= comp_count[4:0];
			visited_addr_1b <= comp_count[4:0]+5'd1;
			visited_addr_2a <= comp_count[4:0]+5'd2;
			visited_addr_2b <= comp_count[4:0]+5'd3;
			
			//fetch distance of each neighbor
			dist_addr_1a <= comp_count[4:0];
			dist_addr_1b <= comp_count[4:0]+5'd1;
			dist_addr_2a <= comp_count[4:0]+5'd2;
			dist_addr_2b <= comp_count[4:0]+5'd3;
			
			//fetch distance of each neighbor
			prev_addr_1a <= comp_count[4:0];
			prev_addr_1b <= comp_count[4:0]+5'd1;
			prev_addr_2a <= comp_count[4:0]+5'd2;
			prev_addr_2b <= comp_count[4:0]+5'd3;
			
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			
			
			
			update_count <= update_count + 5'd1;
			
			//update_count <= update_count;
			
		end//0m
		else if(update_count > 5'd14 && update_count < 5'd18)//----------------------------COMPARISON---------------------------------
		begin//change to 2 cycles
		
			//test
			prev_addr_1a <= comp_reg1;
			prev_addr_1b <= comp_reg2;
			prev_addr_2a <= comp_reg3;
			prev_addr_2b <= comp_reg4;
			
		
			//fetch visited info about each neighbor
			visited_addr_1a <= comp_reg1;
			visited_addr_1b <= comp_reg2;
			visited_addr_2a <= comp_reg3;
			visited_addr_2b <= comp_reg4;
			
			
			//fetch distance of each neighbor
			dist_addr_1a <= comp_reg1;
			dist_addr_1b <= comp_reg2;
			dist_addr_2a <= comp_reg3;
			dist_addr_2b <= comp_reg4;
			
				
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
		
		if((visited_read_1a == 1'b1) || (comp_reg1 == u) || (dist_read_1a == 8'd0))
		begin
			comp_in1 <= 11'b11111111111;
		end
		else
		begin
			comp_in1[10:6] <= comp_reg1;
			comp_in1[5:0] <= dist_read_1a[5:0];
		end
		
		if((visited_read_1b == 1'b1) || (comp_reg2 == u) || (dist_read_1b == 8'd0))
		begin
			comp_in2 <= 11'b11111111111;
		end
		else
		begin
			comp_in2[10:6] <= comp_reg2;
			comp_in2[5:0] <= dist_read_1b[5:0];
		end
		
		if((visited_read_2a == 1'b1) || (comp_reg3 == u) || (dist_read_2a == 8'd0))
		begin
			comp_in3 <= 11'b11111111111;
		end
		else
		begin
			comp_in3[10:6] <= comp_reg3;
			comp_in3[5:0] <= dist_read_2a[5:0];
		end
		
		if((visited_read_2b == 1'b1) || (comp_reg4 == u) || (dist_read_2b == 8'd0))
		begin
			comp_in4 <= 11'b11111111111;
		end
		else
		begin
			comp_in4[10:6] <= comp_reg4;
			comp_in4[5:0] <= dist_read_2b[5:0];
		end
			
		if(comp_out[5:0] < node_min[5:0])
			update_min <= 1'b1;
		else
			update_min <= 1'b0;
		
		update_count <= update_count + 5'd1;
				
		end//		
		
		
		
		
		else if(update_count == 5'd18)
		begin//0n
				
			if(update_min == 1'b1)
			begin
				node_min <= comp_out;
			end
			else
			begin
				node_min <= node_min;
			end			
		
			if(comp_count < 9'd12)
			begin			
				comp_count <= comp_count + 9'd4;
				update_count <= 5'd14;
				//update_count <= update_count;
			end
			else
			begin
				comp_count <= 9'd0;				
				update_count <= update_count + 5'd1;				
			end
			
			

//			dist_we_1a <= 1'b0;
//			dist_we_1b <= 1'b0;
//			dist_we_2a <= 1'b0;
//			dist_we_2b <= 1'b0;
			
		end//0n
				
		else if(update_count == 5'd19)
		begin//0o
		
		
			graph_addr_1a <= u;
			graph_addr_2a <= u;
			graph_addr_3a <= u;
			graph_addr_4a <= u;
		
			//u <= comp_out[10:6];			
			u <= node_min[10:6];
			comp_count <= 9'd0;
			
			//fetch visited info about each neighbor
			visited_addr_1a <= graph_read_1a[10:6];
			visited_addr_1b <= graph_read_2a[10:6];
			visited_addr_2a <= graph_read_3a[10:6];
			visited_addr_2b <= graph_read_4a[10:6];
			
			
			//fetch distance of each neighbor
			dist_addr_1a <= graph_read_1a[10:6];
			dist_addr_1b <= graph_read_2a[10:6];
			dist_addr_2a <= graph_read_3a[10:6];
			dist_addr_2b <= graph_read_4a[10:6];
				
			
			
			iter_count <= iter_count + 5'd1;
			update_count <= 5'd0;
			done_count <= 3'd0;
				
			//update_count <= update_count;
		
		end//0o		
		else
			DONE <= 1'b0;
	end//check done
		else//Algorithm done
		begin//cd0
			DONE <= 1'b1;
			idle_state <= 1'b0;
			corrected_num_nodes <= num_nodes - 6'd1;
		end//cd0
	end//0	
	else if (op == 3'd4)//when algorithm is done
		begin	
			dist_addr_1a <= 5'd0;
			visited_addr_1a <= 5'd0;
			prev_addr_1a <= num_nodes[4:0];
			
			dist_we_1a <= 1'b0;
			dist_we_1b <= 1'b0;
			dist_we_2a <= 1'b0;
			dist_we_2b <= 1'b0;
			
			visited_we_1a <= 1'b0;
			visited_we_1b <= 1'b0;
			visited_we_2a <= 1'b0;
			visited_we_2b <= 1'b0;
			
			prev_we_1a <= 1'b0;
			prev_we_1b <= 1'b0;
			prev_we_2a <= 1'b0;
			prev_we_2b <= 1'b0;
			
			prev_state <= 1'b1;
			path_check <= 1'b0;
			path_check2 <= 1'b0;
			
			idle_state = 1'b1;
			
		end
		else
		begin			

			if (chipselect && write)
				prev_addr_1a <= data_in[4:0];
			else
				prev_addr_1a <= prev_addr_1a;		
			
		end
			
			
		
end

always_comb
begin
	data_out [7:0] = 8'd0 + prev_read_1a;
end

endmodule
