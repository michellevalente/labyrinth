module controller(input logic       clk,
            input logic [3:0] KEY,
				input logic [3:0] SW,
            output [7:0]      hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7);

logic [7:0] counter;
logic op;
logic [7:0] data_in;
logic [7:0] data_out;

hex7seg    h0( .a(data_out[7]), .y(hex0) ),
           h1( .a(data_out[6]), .y(hex1) ),
			  h2( .a(data_out[5]), .y(hex2) ),
			  h3( .a(data_out[4]), .y(hex3) ),
           h4( .a(data_out[3]), .y(hex4) ),
			  h5( .a(data_out[2]), .y(hex5) ),
			  h6( .a(data_out[1]), .y(hex6) ),
			  h7( .a(data_out[0]), .y(hex7) );

datapath datapath(.*);

always_ff @(posedge clk)
begin
	if (counter < 8'd20) //Sends initialization signal
		begin
			counter <= counter + 8'd1;
			op <= 1'd1;
		end	
//	else if (counter > 8'd19 & counter <) // Sends start operation signal
//		counter <= counter + 8'd1;
//		op <= 2'd2;
	else              // Sends Idle Signal
		begin
			counter <= 8'd20;
			op <= 1'd0;
		end
end
	
endmodule

