/*
 * Top-level module for the SoCKit board
 * 
 * Stephen A. Edwards, Columbia University
 * 
 * From an original by Terasic Technologies Inc.
 */

//`define ENABLE_DDR3
//`define ENABLE_HPS
//`define ENABLE_HSMC_XCVR

module SoCKit_Top(
  input logic 	      AUD_ADCDAT,
  inout logic 	      AUD_ADCLRCK, AUD_BCLK, AUD_DACLRCK, AUD_I2C_SDAT,
  output logic 	      AUD_I2C_SCLK, AUD_DACDAT, AUD_MUTE, AUD_XCK,

`ifdef ENABLE_DDR3
  output logic [14:0] DDR3_A,
  output logic [2:0]  DDR3_BA,
  output logic 	      DDR3_RAS_n, DDR3_CAS_n, DDR3_CKE, DDR3_CK_n, DDR3_CK_p,
		      DDR3_CS_n, DDR3_ODT, DDR3_RESET_n, DDR3_WE_n,
  output logic [3:0]  DDR3_DM,
  inout logic [31:0]  DDR3_DQ,
  inout logic [3:0]   DDR3_DQS_n, DDR3_DQS_p,
  input logic 	      DDR3_RZQ,
`endif

  output logic 	      FAN_CTRL,

`ifdef ENABLE_HPS
  input logic 	      HPS_CLOCK_25, HPS_CLOCK_50, HPS_CONV_USB_n,
  output logic [14:0] HPS_DDR3_A,
  output logic [2:0]  HPS_DDR3_BA,
  output logic 	      HPS_DDR3_CAS_n, HPS_DDR3_CKE, HPS_DDR3_CK_n,
		      HPS_DDR3_CK_p, HPS_DDR3_CS_n,
  output logic [3:0]  HPS_DDR3_DM,
  inout logic [31:0]  HPS_DDR3_DQ,
  inout logic [3:0]   HPS_DDR3_DQS_n, HPS_DDR3_DQS_p, 
  output logic 	      HPS_DDR3_ODT, HPS_DDR3_RAS_n, HPS_DDR3_RESET_n,
		      HPS_DDR3_WE_n, HPS_ENET_MDC, HPS_ENET_RESET_n,
		      HPS_ENET_TX_EN, HPS_FLASH_DCLK, HPS_FLASH_NCSO,
  input logic [3:0]   HPS_ENET_RX_DATA, 
  input logic 	      HPS_DDR3_RZQ, HPS_ENET_GTX_CLK, HPS_ENET_RX_CLK,
		      HPS_ENET_INT_n, HPS_ENET_RX_DV, HPS_GSENSOR_INT,
		      HPS_LCM_SPIM_CLK, 
  inout logic 	      HPS_ENET_MDIO,
  inout logic 	      HPS_I2C_CLK,
  inout logic 	      HPS_I2C_SDA,
  inout logic [3:0]   HPS_FLASH_DATA,
  inout logic [3:0]   HPS_KEY,
  output logic [3:0]  HPS_ENET_TX_DATA,
  output logic 	      HPS_LCM_D_C,
  output logic 	      HPS_LCM_RST_N,
  inout logic 	      HPS_LCM_SPIM_MISO,
  output logic 	      HPS_LCM_SPIM_MOSI,
  output logic 	      HPS_LCM_SPIM_SS,
  output logic [3:0]  HPS_LED,
  inout logic 	      HPS_LTC_GPIO,
  input logic 	      HPS_RESET_n,
  output logic 	      HPS_SD_CLK,
  inout logic 	      HPS_SD_CMD,
  inout logic [3:0]   HPS_SD_DATA,
  output logic 	      HPS_SPIM_CLK,
  input logic 	      HPS_SPIM_MISO,
  output logic 	      HPS_SPIM_MOSI,
  output logic 	      HPS_SPIM_SS,
  input logic [3:0]   HPS_SW,
  input logic 	      HPS_UART_RX,
  output logic 	      HPS_UART_TX,
  input logic 	      HPS_USB_CLKOUT,
  inout logic [7:0]   HPS_USB_DATA,
  input logic 	      HPS_USB_DIR,
  input logic 	      HPS_USB_NXT,
  output logic 	      HPS_USB_RESET_PHY,
  output logic 	      HPS_USB_STP,
  input logic 	      HPS_WARM_RST_n,
`endif
		  
  input logic [2:1]   HSMC_CLKIN_n, HSMC_CLKIN_p,
  output logic [2:1]  HSMC_CLKOUT_n, HSMC_CLKOUT_p,
  input logic 	      HSMC_CLK_IN0,
  output logic 	      HSMC_CLK_OUT0,
  inout logic [3:0]   HSMC_D,
`ifdef ENABLE_HSMC_XCVR
  input logic [7:0]   HSMC_GXB_RX_p,
  output logic [7:0]  HSMC_GXB_TX_p,
  input logic 	      HSMC_REF_CLK_p,
`endif
  inout logic [16:0]  HSMC_RX_n, HSMC_RX_p,
  inout logic [16:0]  HSMC_TX_n, HSMC_TX_p,
  inout logic 	      HSMC_SDA,
  output logic 	      HSMC_SCL,

  input logic 	      IRDA_RXD,

  input logic [3:0]   KEY,

  output logic [3:0]  LED,

  input logic 	      OSC_50_B3B, OSC_50_B4A, OSC_50_B5B, OSC_50_B8A,

  input logic 	      PCIE_PERST_n, PCIE_WAKE_n,

  input logic 	      RESET_n,

  inout logic 	      SI5338_SCL, SI5338_SDA,

  input logic [3:0]   SW,

  output logic 	      TEMP_CS_n, TEMP_DIN, TEMP_SCLK,
  input logic 	      TEMP_DOUT,

  input logic 	      USB_B2_CLK, USB_OE_n, USB_RD_n, USB_WR_n, USB_RESET_n,
  inout logic [7:0]   USB_B2_DATA,
  output logic 	      USB_EMPTY, USB_FULL,

  inout logic 	      USB_SCL, USB_SDA,

  output logic [7:0]  VGA_R, VGA_G, VGA_B,
  output logic 	      VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n, VGA_SYNC_n 
);

   // Set outputs to default values and bidirectional pins to inputs
   // to disable warnings.  Override these when you use these peripherals.
   
   assign {AUD_XCK, AUD_MUTE, AUD_I2C_SCLK, AUD_DACDAT} = 4'b0;
   assign {AUD_ADCLRCK, AUD_BCLK, AUD_DACLRCK, AUD_I2C_SDAT} = 4'bZ;

`ifdef ENABLE_DDR3  
   assign {DDR3_A, DDR3_BA, DDR3_DM} = 22'b0;
   assign {DDR3_RAS_n, DDR3_CAS_n, DDR3_CKE, DDR3_CK_n, DDR3_CK_p,
	   DDR3_CS_n, DDR3_ODT, DDR3_RESET_n, DDR3_WE_n} = 9'b0;
   assign DDR3_DQ = 32'bZ;
   assign {DDR3_DQS_n, DDR3_DQS_p} = 8'bZ;
`endif

   assign FAN_CTRL = 1'b0;

   assign {HSMC_CLKOUT_n[2:1], HSMC_CLKOUT_p[2:1]} = 4'b0;
   assign {HSMC_CLK_OUT0, HSMC_SCL} = 2'b0;
   assign {HSMC_D[3:0], HSMC_RX_n[16:0], HSMC_RX_p[16:0], HSMC_SDA} = 39'bZ;
   assign {HSMC_TX_n[16:0], HSMC_TX_p[16:0]} = 34'bZ;   
   
   assign {SI5338_SCL, SI5338_SDA} = 2'bZ;  

   assign {TEMP_CS_n, TEMP_DIN, TEMP_SCLK} = 3'b100;

   assign {USB_EMPTY, USB_FULL} = 2'b00;
   assign {USB_B2_DATA[7:0], USB_SCL, USB_SDA} = 10'bZ;

   // Control the LEDs with the switches and pushbuttons
   
   assign LED[3:0] = SW[3:0] ^ KEY[3:0];

   logic [7:0] 	      hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7,
		      lab1hex0, lab1hex2, lab1hex3;

   // Instantiate the LED emulator
   VGA_LED_Emulator led_emulator(.clk50(OSC_50_B3B), .reset(~RESET_n), .*);

   // Instantiate the lab1 module
   lab1 lab1( .clk(OSC_50_B3B),
	      .hex0(lab1hex0), .hex2(lab1hex2), .hex3(lab1hex3),
	      .* );

   always_comb begin
      if (SW[0]) begin
	 hex0 = 8'b00111001; // C
	 hex1 = 8'b01101101; // S
	 hex2 = 8'b01111001; // E
	 hex3 = 8'b01111001; // E
	 hex4 = 8'b01100110; // 4
	 hex5 = 8'b01111111; // 8
	 hex6 = 8'b01100110; // 4
	 hex7 = 8'b10111111; // 0
      end else begin
	 hex0 = lab1hex0;
	 hex1 = 8'b0;
	 hex2 = lab1hex2;
	 hex3 = lab1hex3;
	 hex4 = 8'b0;
	 hex5 = 8'b0;
	 hex6 = 8'b0;
	 hex7 = 8'b0;
      end
   end
      
endmodule
