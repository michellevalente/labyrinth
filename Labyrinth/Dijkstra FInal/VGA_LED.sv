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

	 
   logic [7:0] hex0, hex1, hex2, hex3,
				  hex4, hex5, hex6, hex7;
	
	logic [31:0] data_out;
	
	logic [2:0] op;	
				  
	always_comb
	begin
		if (data_out[7] == 1'b0)
			hex0 = 8'b00111111;
		else
			hex0 = 8'b00000110;
			
		if (data_out[6] == 1'b0)
			hex1 = 8'b00111111;
		else
			hex1 = 8'b00000110;
		
		if (data_out[5] == 1'b0)
			hex2 = 8'b00111111;
		else
			hex2 = 8'b00000110;
			
		if (data_out[4] == 1'b0)
			hex3 = 8'b00111111;
		else
			hex3 = 8'b00000110;
		
		if (data_out[3] == 1'b0)
			hex4 = 8'b00111111;
		else
			hex4 = 8'b00000110;
			
		if (data_out[2] == 1'b0)
			hex5 = 8'b00111111;
		else
			hex5 = 8'b00000110;
		
		if (data_out[1] == 1'b0)
			hex6 = 8'b00111111;
		else
			hex6 = 8'b00000110;
			
		if (data_out[0] == 1'b0)
			hex7 = 8'b00111111;
		else
			hex7 = 8'b00000110;			
	
	end

   VGA_LED_Emulator led_emulator(.clk50(clk), .*);

	datapath datapath(.SW(SW), .KEY(KEY), .clk(clk),.op(op), .data_out(data_out), .init_done(init_done), .update_done(update_done),.DONE(DONE), .data_in(writedata), .write(write), .chipselect(chipselect));

	logic START, init_done, update_done, DONE;

	logic [3:0] idle_count;

	always_ff @(posedge clk)
	begin
		if (idle_count < 4'd10)
		begin	
			START <= 1'b0;
			idle_count <= idle_count + 4'd1;
		end
		else
			START <= 1'b1;
	end	

	always_comb
	begin
		if (START == 1'b1)
		begin
			if(op <= 3'd1 && init_done == 1'b0)
				op = 3'd1; //Initialization Signal
			else
			begin//Initialization done
				if (DONE == 1'b1)
					op = 3'd4; //DONE Signal
				else
				begin
					op = 3'd2; //not done yet
				end		
			end						
		end
		else 
			op = 3'd0; //Idle Signal
	end	
	       
endmodule
