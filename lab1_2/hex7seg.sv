module hex7seg(input logic a,
	       output logic [7:0] y);

   always_comb
	  if (a == 1'd0)
	    y = 8'b0011_1111;
	  else
		 y = 8'b0000_0110;
endmodule
