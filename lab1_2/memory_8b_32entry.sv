module memory_8b_32entry(
		input logic clk,
	   input logic [4:0]  address,
	   input logic [7:0]  data_in,
	   input logic write_enable,
	   output logic [7:0] data_out);
   
logic [7:0] mem [31:0];

always_ff @(posedge clk) begin
	if (write_enable) mem[address] <= data_in;
	data_out <= mem[address];
end
        
endmodule