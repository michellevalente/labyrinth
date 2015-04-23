module controller(input logic       clk,
            input logic [3:0] KEY,
				input logic [3:0] SW,
            output [7:0]      hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7);
   
//	
//	logic [10:0] in_0 ;
//	logic [10:0] in_1;
//	logic [10:0] in_2;
//	logic [10:0] in_3;
//	logic [10:0] in_4;
//	logic [10:0] in_5;
//	logic [10:0] in_6;
//	logic [10:0] in_7;
//	logic [10:0] in_8;
//	logic [10:0] in_9;
//	logic [10:0] in_10;
//	logic [10:0] in_11;
//	logic [10:0] in_12;
//	logic [10:0] in_13;
//	logic [10:0] in_14;
//	logic [10:0] in_15;
//	logic [10:0] in_16;
//	logic [10:0] in_17;
//	logic [10:0] in_18;
//	logic [10:0] in_19;
//	logic [10:0] in_20;
//	logic [10:0] in_21;
//	logic [10:0] in_22;
//	logic [10:0] in_23;
//	logic [10:0] in_24;
//	logic [10:0] in_25;
//	logic [10:0] in_26;
//	logic [10:0] in_27;
//	logic [10:0] in_28;
//	logic [10:0] in_29;
//	logic [10:0] in_30;
//	logic [10:0] in_31;
//	
//	logic [10:0] out_1;
//	
//	assign in_0 = 11'b10101100000;
//	assign in_1 = 11'b10101100000;
//	assign in_2 = 11'b10101100000;
//	assign in_3 = 11'b10101100000;
//	assign in_4 = 11'b10101100000;
//											assign in_5 = 11'b10011000001;
//	assign in_6 = 11'b10101100000;
//	assign in_7 = 11'b10101100000;
//	assign in_8 = 11'b10101100000;
//	assign in_9 = 11'b10101100000;
//	assign in_10 = 11'b10101100000;
//	assign in_11 = 11'b10101100000;
//	assign in_12 = 11'b10101100000;
//	assign in_13 = 11'b10101100000;
//	assign in_14 = 11'b10101100000;
//	assign in_15 = 11'b10101100000;
//	assign in_16 = 11'b10101100000;
//	assign in_17 = 11'b10101100000;
//	assign in_18 = 11'b10101100000;
//	assign in_19 = 11'b10101100000;
//	assign in_20 = 11'b10101100000;
//	assign in_21 = 11'b10101100000;
//	assign in_22 = 11'b10101100000;
//	assign in_23 = 11'b10101100000;
//	assign in_24 = 11'b10101100000;
//	assign in_25 = 11'b10101100000;
//	assign in_26 = 11'b10101100000;
//	assign in_27 = 11'b10101100000;
//	assign in_28 = 11'b10101100000;
//	assign in_29 = 11'b10101100000;
//	assign in_30 = 11'b10101100000;
//	assign in_31 = 11'b10101100000;
//	
//	comp_1 comparator(.*);

logic counter;
logic op;
logic [7:0] data_in;
logic [7:0] data_out;

memory_controller memory_controller(.*);

always_ff @(posedge clk)
begin
	if (counter < 100) //Sends initialization signal
		begin
			op <= 1;
			counter <= counter + 1;
		end
	else              //Sends idle signal 
		op <= 0;		
end

   hex7seg h0( .a(out_1[10]), .y(hex0) ),
           h1( .a(out_1[9]), .y(hex1) ),
			  h2( .a(out_1[8]), .y(hex2) ),
			  h3( .a(out_1[7]), .y(hex3) ),
           h4( .a(out_1[6]), .y(hex4) ),
			  h5( .a(out_1[6]), .y(hex4) ),
			  h6( .a(out_1[6]), .y(hex4) ),
			  h7( .a(out_1[6]), .y(hex4) );
	
endmodule

