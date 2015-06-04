module comp_1 (
    input logic [18:0] in_0,
    input logic [18:0] in_1,
    input logic [18:0] in_2,
    input logic [18:0] in_3,    
    output logic [18:0] out_1);

    logic [18:0] u_0;
    logic [18:0] u_1;
    
    comp_0 comp_00(.in_0(in_0),.in_1(in_1),.u_0(u_0));
    comp_0 comp_01(.in_0(in_2),.in_1(in_3),.u_0(u_1));
    
    comp_0 comp_16(.in_0(u_0),.in_1(u_1),.u_0(out_1));
    
endmodule
