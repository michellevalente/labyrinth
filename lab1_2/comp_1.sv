module comp_1 (
    input logic [10:0] in_0,
    input logic [10:0] in_1,
    input logic [10:0] in_2,
    input logic [10:0] in_3,
    input logic [10:0] in_4,
    input logic [10:0] in_5,
    input logic [10:0] in_6,
    input logic [10:0] in_7,
    input logic [10:0] in_8,
    input logic [10:0] in_9,
    input logic [10:0] in_10,
    input logic [10:0] in_11,
    input logic [10:0] in_12,
    input logic [10:0] in_13,
    input logic [10:0] in_14,
    input logic [10:0] in_15,
    input logic [10:0] in_16,
    input logic [10:0] in_17,
    input logic [10:0] in_18,
    input logic [10:0] in_19,
    input logic [10:0] in_20,
    input logic [10:0] in_21,
    input logic [10:0] in_22,
    input logic [10:0] in_23,
    input logic [10:0] in_24,
    input logic [10:0] in_25,
    input logic [10:0] in_26,
    input logic [10:0] in_27,
    input logic [10:0] in_28,
    input logic [10:0] in_29,
    input logic [10:0] in_30,
    input logic [10:0] in_31,   
    output logic [10:0] out_1);

    logic [10:0] u_0;
    logic [10:0] u_1;
    logic [10:0] u_2;
    logic [10:0] u_3;
    logic [10:0] u_4;
    logic [10:0] u_5;
    logic [10:0] u_6;
    logic [10:0] u_7;
    logic [10:0] u_8;
    logic [10:0] u_9;
    logic [10:0] u_10;
    logic [10:0] u_11;
    logic [10:0] u_12;
    logic [10:0] u_13;
    logic [10:0] u_14;
    logic [10:0] u_15;

    comp_0 comp_00(.in_0(in_0),.in_1(in_1),.u_0(u_0));
    comp_0 comp_01(.in_0(in_2),.in_1(in_3),.u_0(u_1));
    comp_0 comp_02(.in_0(in_4),.in_1(in_5),.u_0(u_2));
    comp_0 comp_03(.in_0(in_6),.in_1(in_7),.u_0(u_3));
    comp_0 comp_04(.in_0(in_8),.in_1(in_9),.u_0(u_4));
    comp_0 comp_05(.in_0(in_10),.in_1(in_11),.u_0(u_5));
    comp_0 comp_06(.in_0(in_12),.in_1(in_13),.u_0(u_6));
    comp_0 comp_07(.in_0(in_14),.in_1(in_15),.u_0(u_7));
    comp_0 comp_08(.in_0(in_16),.in_1(in_17),.u_0(u_8));
    comp_0 comp_09(.in_0(in_18),.in_1(in_19),.u_0(u_9));
    comp_0 comp_10(.in_0(in_20),.in_1(in_21),.u_0(u_10));
    comp_0 comp_11(.in_0(in_22),.in_1(in_23),.u_0(u_11));
    comp_0 comp_12(.in_0(in_24),.in_1(in_25),.u_0(u_12));
    comp_0 comp_13(.in_0(in_26),.in_1(in_27),.u_0(u_13));
    comp_0 comp_14(.in_0(in_28),.in_1(in_29),.u_0(u_14));
    comp_0 comp_15(.in_0(in_30),.in_1(in_31),.u_0(u_15));

//Second Level Comparison

    logic [10:0] v_0;
    logic [10:0] v_1;
    logic [10:0] v_2;
    logic [10:0] v_3;
    logic [10:0] v_4;
    logic [10:0] v_5;
    logic [10:0] v_6;
    logic [10:0] v_7;

    comp_0 comp_16(.in_0(u_0),.in_1(u_1),.u_0(v_0));
    comp_0 comp_17(.in_0(u_2),.in_1(u_3),.u_0(v_1));
    comp_0 comp_18(.in_0(u_4),.in_1(u_5),.u_0(v_2));
    comp_0 comp_19(.in_0(u_6),.in_1(u_7),.u_0(v_3));
    comp_0 comp_20(.in_0(u_8),.in_1(u_9),.u_0(v_4));
    comp_0 comp_21(.in_0(u_10),.in_1(u_11),.u_0(v_5));
    comp_0 comp_22(.in_0(u_12),.in_1(u_13),.u_0(v_6));
    comp_0 comp_23(.in_0(u_14),.in_1(u_15),.u_0(v_7));
   
//Third Level Comparison   

    logic [10:0] w_0;
    logic [10:0] w_1;
    logic [10:0] w_2;
    logic [10:0] w_3;
   
    comp_0 comp_24(.in_0(v_0),.in_1(v_1),.u_0(w_0));
    comp_0 comp_25(.in_0(v_2),.in_1(v_3),.u_0(w_1));
    comp_0 comp_26(.in_0(v_4),.in_1(v_5),.u_0(w_2));
    comp_0 comp_27(.in_0(v_6),.in_1(v_7),.u_0(w_3));
   
//Fourth Level Comparison

    logic [10:0] x_0;
    logic [10:0] x_1;
   
    comp_0 comp_28(.in_0(w_0),.in_1(w_1),.u_0(x_0));
    comp_0 comp_29(.in_0(w_2),.in_1(w_3),.u_0(x_1));
   
// Final Comparison

    comp_0 comp_30(.in_0(x_0),.in_1(x_1),.u_0(out_1));
   
endmodule
