module memory_8b_1entry(
    input logic clk,
    input logic write,
    input logic address,
    input logic [7:0] in,
    output logic [7:0] out);
    
logic [7:0] mem [1:0];    

always_ff @(posedge clk)
begin
    if (write)
        mem[address] <= in;
        out <= mem[address];
    end

endmodule

