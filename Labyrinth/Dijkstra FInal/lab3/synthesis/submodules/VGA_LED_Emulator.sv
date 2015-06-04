/*
 * Seven-segment LED emulator
 *
 * Stephen A. Edwards, Columbia University
 */

module VGA_LED_Emulator(
 input logic 	    clk50, reset,
 input logic [31:0]  data_out,
 output logic [7:0] VGA_R, VGA_G, VGA_B,
 output logic 	    VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n, VGA_SYNC_n);

 logic [7:0]  hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;
 
 always_comb
	begin
//		if (data_out[7] == 1'b0)
//			hex0 = 8'b00111111;
//		else
//			hex0 = 8'b00000110;
//			
//		if (data_out[6] == 1'b0)
//			hex1 = 8'b00111111;
//		else
//			hex1 = 8'b00000110;
//		
//		if (data_out[5] == 1'b0)
//			hex2 = 8'b00111111;
//		else
//			hex2 = 8'b00000110;
//			
//		if (data_out[4] == 1'b0)
//			hex3 = 8'b00111111;
//		else
//			hex3 = 8'b00000110;
//		
//		if (data_out[3] == 1'b0)
//			hex4 = 8'b00111111;
//		else
//			hex4 = 8'b00000110;
//			
//		if (data_out[2] == 1'b0)
//			hex5 = 8'b00111111;
//		else
//			hex5 = 8'b00000110;
//		
//		if (data_out[1] == 1'b0)
//			hex6 = 8'b00111111;
//		else
//			hex6 = 8'b00000110;
//			
//		if (data_out[0] == 1'b0)
//			hex7 = 8'b00111111;
//		else
//			hex7 = 8'b00000110;			
	
		case(data_out [31:28])
		
			4'd0:        hex0 = 8'b0011_1111;
			4'd1:        hex0 = 8'b0000_0110;
			4'd2:        hex0 = 8'b0101_1011;
			4'd3:        hex0 = 8'b0100_1111;
			4'd4:        hex0 = 8'b0110_0110;
			4'd5:        hex0 = 8'b0110_1101;
			4'd6:        hex0 = 8'b0111_1101;
			4'd7:        hex0 = 8'b0000_0111;
			4'd8:        hex0 = 8'b0111_1111;
			4'd9:        hex0 = 8'b0110_0111;
			4'd10:    hex0 = 8'b0111_0111;
			4'd11:    hex0 = 8'b0111_1100;
			4'd12:    hex0 = 8'b0011_1001;
			4'd13:    hex0 = 8'b0101_1110;
			4'd14:    hex0 = 8'b0111_1001;
			4'd15:    hex0 = 8'b0111_0001;
			default:    hex0 = 8'b0000_0000;
		endcase

		case(data_out[27:24])
		
		4'd0:        hex1 = 8'b0011_1111;
			4'd1:        hex1 = 8'b0000_0110;
			4'd2:        hex1 = 8'b0101_1011;
			4'd3:        hex1 = 8'b0100_1111;
			4'd4:        hex1 = 8'b0110_0110;
			4'd5:        hex1 = 8'b0110_1101;
			4'd6:        hex1 = 8'b0111_1101;
			4'd7:        hex1 = 8'b0000_0111;
			4'd8:        hex1 = 8'b0111_1111;
			4'd9:        hex1 = 8'b0110_0111;
			4'd10:    hex1 = 8'b0111_0111;
			4'd11:    hex1 = 8'b0111_1100;
			4'd12:    hex1 = 8'b0011_1001;
			4'd13:    hex1 = 8'b0101_1110;
			4'd14:    hex1 = 8'b0111_1001;
			4'd15:    hex1 = 8'b0111_0001;
			default:    hex1 = 8'b0000_0000;
		endcase	
	
		case(data_out[23:20])
		
		4'd0:        hex2 = 8'b0011_1111;
			4'd1:        hex2 = 8'b0000_0110;
			4'd2:        hex2 = 8'b0101_1011;
			4'd3:        hex2 = 8'b0100_1111;
			4'd4:        hex2 = 8'b0110_0110;
			4'd5:        hex2 = 8'b0110_1101;
			4'd6:        hex2 = 8'b0111_1101;
			4'd7:        hex2 = 8'b0000_0111;
			4'd8:        hex2 = 8'b0111_1111;
			4'd9:        hex2 = 8'b0110_0111;
			4'd10:    hex2 = 8'b0111_0111;
			4'd11:    hex2 = 8'b0111_1100;
			4'd12:    hex2 = 8'b0011_1001;
			4'd13:    hex2 = 8'b0101_1110;
			4'd14:    hex2 = 8'b0111_1001;
			4'd15:    hex2 = 8'b0111_0001;
			default:    hex2 = 8'b0000_0000;
		endcase	
		
		case(data_out[19:16])
		
	4'd0:        hex3 = 8'b0011_1111;
			4'd1:        hex3 = 8'b0000_0110;
			4'd2:        hex3 = 8'b0101_1011;
			4'd3:        hex3 = 8'b0100_1111;
			4'd4:        hex3 = 8'b0110_0110;
			4'd5:        hex3 = 8'b0110_1101;
			4'd6:        hex3 = 8'b0111_1101;
			4'd7:        hex3 = 8'b0000_0111;
			4'd8:        hex3 = 8'b0111_1111;
			4'd9:        hex3 = 8'b0110_0111;
			4'd10:    hex3 = 8'b0111_0111;
			4'd11:    hex3 = 8'b0111_1100;
			4'd12:    hex3 = 8'b0011_1001;
			4'd13:    hex3 = 8'b0101_1110;
			4'd14:    hex3 = 8'b0111_1001;
			4'd15:    hex3 = 8'b0111_0001;
			default:    hex3 = 8'b0000_0000;
		endcase

		case(data_out[15:12])
	
		
			4'd0:        hex4 = 8'b0011_1111;
			4'd1:        hex4 = 8'b0000_0110;
			4'd2:        hex4 = 8'b0101_1011;
			4'd3:        hex4 = 8'b0100_1111;
			4'd4:        hex4 = 8'b0110_0110;
			4'd5:        hex4 = 8'b0110_1101;
			4'd6:        hex4 = 8'b0111_1101;
			4'd7:        hex4 = 8'b0000_0111;
			4'd8:        hex4 = 8'b0111_1111;
			4'd9:        hex4 = 8'b0110_0111;
			4'd10:    hex4 = 8'b0111_0111;
			4'd11:    hex4 = 8'b0111_1100;
			4'd12:    hex4 = 8'b0011_1001;
			4'd13:    hex4 = 8'b0101_1110;
			4'd14:    hex4 = 8'b0111_1001;
			4'd15:    hex4 = 8'b0111_0001;
			default:    hex4 = 8'b0000_0000;
		endcase
	
		case(data_out[11:8])
	
			
			4'd0:        hex5 = 8'b0011_1111;
			4'd1:        hex5 = 8'b0000_0110;
			4'd2:        hex5 = 8'b0101_1011;
			4'd3:        hex5 = 8'b0100_1111;
			4'd4:        hex5 = 8'b0110_0110;
			4'd5:        hex5 = 8'b0110_1101;
			4'd6:        hex5 = 8'b0111_1101;
			4'd7:        hex5 = 8'b0000_0111;
			4'd8:        hex5 = 8'b0111_1111;
			4'd9:        hex5 = 8'b0110_0111;
			4'd10:    hex5 = 8'b0111_0111;
			4'd11:    hex5 = 8'b0111_1100;
			4'd12:    hex5 = 8'b0011_1001;
			4'd13:    hex5 = 8'b0101_1110;
			4'd14:    hex5 = 8'b0111_1001;
			4'd15:    hex5 = 8'b0111_0001;
			default:    hex5 = 8'b0000_0000;
		endcase
	
		case(data_out[7:4])
		
					4'd0:        hex6 = 8'b0011_1111;
			4'd1:        hex6 = 8'b0000_0110;
			4'd2:        hex6 = 8'b0101_1011;
			4'd3:        hex6 = 8'b0100_1111;
			4'd4:        hex6 = 8'b0110_0110;
			4'd5:        hex6 = 8'b0110_1101;
			4'd6:        hex6 = 8'b0111_1101;
			4'd7:        hex6 = 8'b0000_0111;
			4'd8:        hex6 = 8'b0111_1111;
			4'd9:        hex6 = 8'b0110_0111;
			4'd10:    hex6 = 8'b0111_0111;
			4'd11:    hex6 = 8'b0111_1100;
			4'd12:    hex6 = 8'b0011_1001;
			4'd13:    hex6 = 8'b0101_1110;
			4'd14:    hex6 = 8'b0111_1001;
			4'd15:    hex6 = 8'b0111_0001;
			default:    hex6 = 8'b0000_0000;
		endcase
		
		case(data_out[3:0])
			
			4'd0:        hex7 = 8'b0011_1111;
			4'd1:        hex7 = 8'b0000_0110;
			4'd2:        hex7 = 8'b0101_1011;
			4'd3:        hex7 = 8'b0100_1111;
			4'd4:        hex7 = 8'b0110_0110;
			4'd5:        hex7 = 8'b0110_1101;
			4'd6:        hex7 = 8'b0111_1101;
			4'd7:        hex7 = 8'b0000_0111;
			4'd8:        hex7 = 8'b0111_1111;
			4'd9:        hex7 = 8'b0110_0111;
			4'd10:    hex7 = 8'b0111_0111;
			4'd11:    hex7 = 8'b0111_1100;
			4'd12:    hex7 = 8'b0011_1001;
			4'd13:    hex7 = 8'b0101_1110;
			4'd14:    hex7 = 8'b0111_1001;
			4'd15:    hex7 = 8'b0111_0001;
			default:    hex7 = 8'b0000_0000;
		endcase	
	
	end

 
/*
 * 640 X 480 VGA timing for a 50 MHz clock: one pixel every other cycle
 * 
 * HCOUNT 1599 0             1279       1599 0
 *             _______________              ________
 * ___________|    Video      |____________|  Video
 * 
 * 
 * |SYNC| BP |<-- HACTIVE -->|FP|SYNC| BP |<-- HACTIVE
 *       _______________________      _____________
 * |____|       VGA_HS          |____|
 */
   // Parameters for hcount
   parameter HACTIVE      = 11'd 1280,
             HFRONT_PORCH = 11'd 32,
             HSYNC        = 11'd 192,
             HBACK_PORCH  = 11'd 96,   
             HTOTAL       = HACTIVE + HFRONT_PORCH + HSYNC + HBACK_PORCH; // 1600
   
   // Parameters for vcount
   parameter VACTIVE      = 10'd 480,
             VFRONT_PORCH = 10'd 10,
             VSYNC        = 10'd 2,
             VBACK_PORCH  = 10'd 33,
             VTOTAL       = VACTIVE + VFRONT_PORCH + VSYNC + VBACK_PORCH; // 525

   logic [10:0]			     hcount; // Horizontal counter
                                             // Hcount[10:1] indicates pixel column (0-639)
   logic 			     endOfLine;
   
   always_ff @(posedge clk50 or posedge reset)
     if (reset)          hcount <= 0;
     else if (endOfLine) hcount <= 0;
     else  	         hcount <= hcount + 11'd 1;

   assign endOfLine = hcount == HTOTAL - 1;

   // Vertical counter
   logic [9:0] 			     vcount;
   logic 			     endOfField;
   
   always_ff @(posedge clk50 or posedge reset)
     if (reset)          vcount <= 0;
     else if (endOfLine)
       if (endOfField)   vcount <= 0;
       else              vcount <= vcount + 10'd 1;

   assign endOfField = vcount == VTOTAL - 1;

   // Horizontal sync: from 0x520 to 0x5DF (0x57F)
   // 101 0010 0000 to 101 1101 1111
   assign VGA_HS = !( (hcount[10:8] == 3'b101) & !(hcount[7:5] == 3'b111));
   assign VGA_VS = !( vcount[9:1] == (VACTIVE + VFRONT_PORCH) / 2);

   assign VGA_SYNC_n = 1; // For adding sync to video signals; not used for VGA
   
   // Horizontal active: 0 to 1279     Vertical active: 0 to 479
   // 101 0000 0000  1280	       01 1110 0000  480
   // 110 0011 1111  1599	       10 0000 1100  524
   assign VGA_BLANK_n = !( hcount[10] & (hcount[9] | hcount[8]) ) &
			!( vcount[9] | (vcount[8:5] == 4'b1111) );   

   /* VGA_CLK is 25 MHz
    *             __    __    __
    * clk50    __|  |__|  |__|
    *        
    *             _____       __
    * hcount[0]__|     |_____|
    */
   assign VGA_CLK = hcount[0]; // 25 MHz clock: pixel latched on rising edge

   /* 
    *    0 1 2 3 4 5 6 7
    * 
    * 0  afa a a a ab
    * 1  f         b
    * 2  f         b
    * 3  f         b
    * 4  f         b
    * 5  f         b
    * 6 efgggggggggbc 
    * 7  e         c
    * 8  e         c
    * 9  e         c
    * 10 e         c
    * 11 e         c
    * 12 edddddddddc
    * 13
    * 14             h
    * 15
    *
    * 640 x 480
    * 
    * Each seven-segment "pixel" is 8x8: 64 pixels across, 512 pixels for
    * 8 characters being displayed
    * 64 + 512 + 64 = 640  Start in column 64, end in column 576
    * 
    * 128 pixels high: start at row 128, end at row 256
    * 128 + 128 + 224 = 480  Start in row 128
    */

   logic 			     inChar; // In any character

   assign inChar = (vcount[9:7] == 3'd1) &
		   (hcount[10:7] != 4'd0 & hcount[10:7] != 4'd9);
   
   logic [2:0] 			     charx; // Coordinate within the 8x16 char
   logic [3:0] 			     chary;

   assign charx = hcount[6:4];
   assign chary = vcount[6:3];

   logic horizBar, leftCol, rightCol, topCol, botCol; // Parts of the disp.

   assign horizBar = !(charx[2:1] == 2'b11);  // When in any horizontal bar
   assign leftCol  = (charx == 3'd0);         // When in left column
   assign rightCol = (charx == 3'd5);         // When in right column
   assign topCol   = !chary[3] & !(chary[2:0] == 3'd7); // Top columns
   assign botCol   = (chary >= 4'd6) & (chary <= 4'd12); // Bottom columns

   logic [7:0] segment; // True when in each segment
   assign segment[0] = horizBar & (chary == 4'd 0);
   assign segment[1] = rightCol & topCol;
   assign segment[2] = rightCol & botCol;
   assign segment[3] = horizBar & (chary == 4'd 12);
   assign segment[4] = leftCol & botCol;
   assign segment[5] = leftCol & topCol;
   assign segment[6] = horizBar & (chary == 4'd 6);
   assign segment[7] = (charx == 3'd6) & (chary == 4'd14);

   logic [2:0] column; // Being displayed
   assign column = hcount[9:7];
   
   logic [7:0] curSegs;
   assign curSegs = column == 3'd1 ? hex0 :
		    column == 3'd2 ? hex1 :
		    column == 3'd3 ? hex2 :
		    column == 3'd4 ? hex3 :
		    column == 3'd5 ? hex4 :
		    column == 3'd6 ? hex5 :
		    column == 3'd7 ? hex6 :
		    hex7;
   
   always_comb begin
      {VGA_R, VGA_G, VGA_B} = {8'h0, 8'h0, 8'h0}; // Black
      if (inChar)
	if ( |(curSegs & segment) ) // In any active segment?
	  {VGA_R, VGA_G, VGA_B} = {8'hff, 8'h00, 8'h00}; // Red
	else if ( |segment )        // In any (inactive) segment?
	  {VGA_R, VGA_G, VGA_B} = {8'h20, 8'h20, 8'h20}; // Dark Gray
   end  
   
endmodule // VGA_LED_Emulator
