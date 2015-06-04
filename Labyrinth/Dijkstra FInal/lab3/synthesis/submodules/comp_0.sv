module comp_0(input logic[10:0] in_0, input logic[10:0] in_1, output logic[10:0] u_0);

always_comb begin
if(in_0[5:0] <= in_1[5:0])
    u_0 = in_0;
else
    u_0 = in_1;
end

endmodule
