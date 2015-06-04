module VGA_LED(input logic        clk,
	       input logic 	  reset,
	       input logic [31:0]  writedata,
	       input logic 	  write,
	       input 		  chipselect,
	       input logic [2:0]  address,
			 input logic [3:0]  KEY,
			 input logic [3:0]  SW,
	       output logic [7:0] VGA_R, VGA_G, VGA_B,
	       output logic 	  VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n,
	       output logic 	  VGA_SYNC_n);

	logic [31:0] data_out;
	
	logic [2:0] op;	
	
   VGA_LED_Emulator led_emulator(.clk50(clk), .*);

	datapath datapath(.SW(SW), .reset(reset),.KEY(KEY), .clk(clk),.op(op), .data_out(data_out), .init_done(init_done), .update_done(update_done),.DONE(DONE), .data_in(writedata), .write(write), .chipselect(chipselect),.idle_state(idle_state));

	logic START, init_done, update_done, DONE, idle_state;

	always_comb
	begin
		if(init_done == 1'b0)
			op = 3'd1; //Initialization Signal
		else
		begin//Initialization done
			if (DONE == 1'b0)
				op = 3'd2;
			else	
				if (idle_state == 1'b0)
					op = 3'd4;
				else
					op = 3'd0;			
		end
	end			
			
endmodule
