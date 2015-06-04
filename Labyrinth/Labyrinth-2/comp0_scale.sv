module comp_0(input logic[18:0] in_0, input logic[18:0] in_1, output logic[18:0] u_0);

always_comb begin
if(in_0[9:0] <= in_1[9:0])
    u_0 = in_0;
else
    u_0 = in_1;
end

endmodule
