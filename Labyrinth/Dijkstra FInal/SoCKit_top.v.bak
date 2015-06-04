// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
// ============================================================================
//
// Major Functions:	SoCKit_Default
//
// ============================================================================
// Revision History :
// ============================================================================
//   Ver  :| Author              :| Mod. Date :| Changes Made:
//   V1.0 :| xinxian             :| 04/02/13  :| Initial Revision
// ============================================================================

//`define ENABLE_DDR3
//`define ENABLE_HPS
//`define ENABLE_HSMC_XCVR

module SoCKit_Top(

		  ///////////AUD/////////////
		  AUD_ADCDAT,
		  AUD_ADCLRCK,
		  AUD_BCLK,
		  AUD_DACDAT,
		  AUD_DACLRCK,
		  AUD_I2C_SCLK,
		  AUD_I2C_SDAT,
		  AUD_MUTE,
		  AUD_XCK,

`ifdef ENABLE_DDR3
		  /////////DDR3/////////
		  DDR3_A,
		  DDR3_BA,
		  DDR3_CAS_n,
		  DDR3_CKE,
		  DDR3_CK_n,
		  DDR3_CK_p,
		  DDR3_CS_n,
		  DDR3_DM,
		  DDR3_DQ,
		  DDR3_DQS_n,
		  DDR3_DQS_p,
		  DDR3_ODT,
		  DDR3_RAS_n,
		  DDR3_RESET_n,
		  DDR3_RZQ,
		  DDR3_WE_n,
`endif /*ENABLE_DDR3*/

		  /////////FAN/////////
		  FAN_CTRL,

`ifdef ENABLE_HPS
		  /////////HPS/////////
		  HPS_CLOCK_25,
		  HPS_CLOCK_50,
		  HPS_CONV_USB_n,
		  HPS_DDR3_A,
		  HPS_DDR3_BA,
		  HPS_DDR3_CAS_n,
		  HPS_DDR3_CKE,
		  HPS_DDR3_CK_n,
		  HPS_DDR3_CK_p,
		  HPS_DDR3_CS_n,
		  HPS_DDR3_DM,
		  HPS_DDR3_DQ,
		  HPS_DDR3_DQS_n,
		  HPS_DDR3_DQS_p,
		  HPS_DDR3_ODT,
		  HPS_DDR3_RAS_n,
		  HPS_DDR3_RESET_n,
		  HPS_DDR3_RZQ,
		  HPS_DDR3_WE_n,
		  HPS_ENET_GTX_CLK,
		  HPS_ENET_INT_n,
		  HPS_ENET_MDC,
		  HPS_ENET_MDIO,
		  HPS_ENET_RESET_n,
		  HPS_ENET_RX_CLK,
		  HPS_ENET_RX_DATA,
		  HPS_ENET_RX_DV,
		  HPS_ENET_TX_DATA,
		  HPS_ENET_TX_EN,
		  HPS_FLASH_DATA,
		  HPS_FLASH_DCLK,
		  HPS_FLASH_NCSO,
		  HPS_GSENSOR_INT,
		  HPS_I2C_CLK,
		  HPS_I2C_SDA,
		  HPS_KEY,
		  HPS_LCM_D_C,
		  HPS_LCM_RST_N,
		  HPS_LCM_SPIM_CLK,
		  HPS_LCM_SPIM_MISO,
		  HPS_LCM_SPIM_MOSI,
		  HPS_LCM_SPIM_SS,
		  HPS_LED,
		  HPS_LTC_GPIO,
		  HPS_RESET_n,
		  HPS_SD_CLK,
		  HPS_SD_CMD,
		  HPS_SD_DATA,
		  HPS_SPIM_CLK,
		  HPS_SPIM_MISO,
		  HPS_SPIM_MOSI,
		  HPS_SPIM_SS,
		  HPS_SW,
		  HPS_UART_RX,
		  HPS_UART_TX,
		  HPS_USB_CLKOUT,
		  HPS_USB_DATA,
		  HPS_USB_DIR,
		  HPS_USB_NXT,
		  HPS_USB_RESET_PHY,
		  HPS_USB_STP,
		  HPS_WARM_RST_n,
`endif /*ENABLE_HPS*/

		  /////////HSMC/////////
		  HSMC_CLKIN_n,
		  HSMC_CLKIN_p,
		  HSMC_CLKOUT_n,
		  HSMC_CLKOUT_p,
		  HSMC_CLK_IN0,
		  HSMC_CLK_OUT0,
		  HSMC_D,

`ifdef ENABLE_HSMC_XCVR

		  HSMC_GXB_RX_p,
		  HSMC_GXB_TX_p,
		  HSMC_REF_CLK_p,
`endif	
		  HSMC_RX_n,
		  HSMC_RX_p,
		  HSMC_SCL,
		  HSMC_SDA,
		  HSMC_TX_n,
		  HSMC_TX_p,

		  /////////IRDA/////////
		  IRDA_RXD,

		  /////////KEY/////////
		  KEY,

		  /////////LED/////////
		  LED,

		  /////////OSC/////////
		  OSC_50_B3B,
		  OSC_50_B4A,
		  OSC_50_B5B,
		  OSC_50_B8A,

		  /////////PCIE/////////
		  PCIE_PERST_n,
		  PCIE_WAKE_n,

		  /////////RESET/////////
		  RESET_n,

		  /////////SI5338/////////
		  SI5338_SCL,
		  SI5338_SDA,

		  /////////SW/////////
		  SW,

		  /////////TEMP/////////
		  TEMP_CS_n,
		  TEMP_DIN,
		  TEMP_DOUT,
		  TEMP_SCLK,

		  /////////USB/////////
		  USB_B2_CLK,
		  USB_B2_DATA,
		  USB_EMPTY,
		  USB_FULL,
		  USB_OE_n,
		  USB_RD_n,
		  USB_RESET_n,
		  USB_SCL,
		  USB_SDA,
		  USB_WR_n,

		  /////////VGA/////////
		  VGA_B,
		  VGA_BLANK_n,
		  VGA_CLK,
		  VGA_G,
		  VGA_HS,
		  VGA_R,
		  VGA_SYNC_n,
		  VGA_VS,
		  ///////////hps//////////
		  memory_mem_a,
		  memory_mem_ba,
		  memory_mem_ck,                         
		  memory_mem_ck_n,                     
		  memory_mem_cke,                      
		  memory_mem_cs_n,                     
		  memory_mem_ras_n,                    
		  memory_mem_cas_n,                    
		  memory_mem_we_n,                     
		  memory_mem_reset_n,                  
		  memory_mem_dq,                       
		  memory_mem_dqs,                      
		  memory_mem_dqs_n,                    
		  memory_mem_odt,                      
		  memory_mem_dm,                       
		  memory_oct_rzqin,                    
		  hps_io_hps_io_emac1_inst_TX_CLK,     
		  hps_io_hps_io_emac1_inst_TXD0,       
		  hps_io_hps_io_emac1_inst_TXD1,       
		  hps_io_hps_io_emac1_inst_TXD2,       
		  hps_io_hps_io_emac1_inst_TXD3,       
		  hps_io_hps_io_emac1_inst_RXD0,       
		  hps_io_hps_io_emac1_inst_MDIO,       
		  hps_io_hps_io_emac1_inst_MDC,        
		  hps_io_hps_io_emac1_inst_RX_CTL,     
		  hps_io_hps_io_emac1_inst_TX_CTL,     
		  hps_io_hps_io_emac1_inst_RX_CLK,     
		  hps_io_hps_io_emac1_inst_RXD1,       
		  hps_io_hps_io_emac1_inst_RXD2,       
		  hps_io_hps_io_emac1_inst_RXD3,       
		  hps_io_hps_io_qspi_inst_IO0,         
		  hps_io_hps_io_qspi_inst_IO1,         
		  hps_io_hps_io_qspi_inst_IO2,         
		  hps_io_hps_io_qspi_inst_IO3,         
		  hps_io_hps_io_qspi_inst_SS0,         
		  hps_io_hps_io_qspi_inst_CLK,         
		  hps_io_hps_io_sdio_inst_CMD,         
		  hps_io_hps_io_sdio_inst_D0,          
		  hps_io_hps_io_sdio_inst_D1,          
		  hps_io_hps_io_sdio_inst_CLK,         
		  hps_io_hps_io_sdio_inst_D2,          
		  hps_io_hps_io_sdio_inst_D3,          
		  hps_io_hps_io_usb1_inst_D0,          
		  hps_io_hps_io_usb1_inst_D1,          
		  hps_io_hps_io_usb1_inst_D2,          
		  hps_io_hps_io_usb1_inst_D3,          
		  hps_io_hps_io_usb1_inst_D4,          
		  hps_io_hps_io_usb1_inst_D5,          
		  hps_io_hps_io_usb1_inst_D6,          
		  hps_io_hps_io_usb1_inst_D7,          
		  hps_io_hps_io_usb1_inst_CLK,         
		  hps_io_hps_io_usb1_inst_STP,         
		  hps_io_hps_io_usb1_inst_DIR,         
		  hps_io_hps_io_usb1_inst_NXT,         
		  hps_io_hps_io_spim0_inst_CLK,        
		  hps_io_hps_io_spim0_inst_MOSI,       
		  hps_io_hps_io_spim0_inst_MISO,       
		  hps_io_hps_io_spim0_inst_SS0,        
		  hps_io_hps_io_spim1_inst_CLK,        
		  hps_io_hps_io_spim1_inst_MOSI,       
		  hps_io_hps_io_spim1_inst_MISO,       
		  hps_io_hps_io_spim1_inst_SS0,        
		  hps_io_hps_io_uart0_inst_RX,         
		  hps_io_hps_io_uart0_inst_TX,         
		  hps_io_hps_io_i2c1_inst_SDA,         
		  hps_io_hps_io_i2c1_inst_SCL,         
		  hps_io_hps_io_gpio_inst_GPIO00     
		  );

   //=======================================================
   //  PORT declarations
   //=======================================================

   ///////// AUD /////////
   input                                              AUD_ADCDAT;
   inout                                              AUD_ADCLRCK;
   inout                                              AUD_BCLK;
   output                                             AUD_DACDAT;
   inout                                              AUD_DACLRCK;
   output                                             AUD_I2C_SCLK;
   inout                                              AUD_I2C_SDAT;
   output                                             AUD_MUTE;
   output                                             AUD_XCK;

`ifdef ENABLE_DDR3
   ///////// DDR3 /////////
   output [14:0] 				      DDR3_A;
   output [2:0] 				      DDR3_BA;
   output                                             DDR3_CAS_n;
   output                                             DDR3_CKE;
   output                                             DDR3_CK_n;
   output                                             DDR3_CK_p;
   output                                             DDR3_CS_n;
   output [3:0] 				      DDR3_DM;
   inout [31:0] 				      DDR3_DQ;
   inout [3:0] 					      DDR3_DQS_n;
   inout [3:0] 					      DDR3_DQS_p;
   output                                             DDR3_ODT;
   output                                             DDR3_RAS_n;
   output                                             DDR3_RESET_n;
   input                                              DDR3_RZQ;
   output                                             DDR3_WE_n;
`endif /*ENABLE_DDR3*/

   ///////// FAN /////////
   output                                             FAN_CTRL;

`ifdef ENABLE_HPS
   ///////// HPS /////////
   input                                              HPS_CLOCK_25;
   input                                              HPS_CLOCK_50;
   input                                              HPS_CONV_USB_n;
   output [14:0] 				      HPS_DDR3_A;
   output [2:0] 				      HPS_DDR3_BA;
   output                                             HPS_DDR3_CAS_n;
   output                                             HPS_DDR3_CKE;
   output                                             HPS_DDR3_CK_n;
   output                                             HPS_DDR3_CK_p;
   output                                             HPS_DDR3_CS_n;
   output [3:0] 				      HPS_DDR3_DM;
   inout [31:0] 				      HPS_DDR3_DQ;
   inout [3:0] 					      HPS_DDR3_DQS_n;
   inout [3:0] 					      HPS_DDR3_DQS_p;
   output                                             HPS_DDR3_ODT;
   output                                             HPS_DDR3_RAS_n;
   output                                             HPS_DDR3_RESET_n;
   input                                              HPS_DDR3_RZQ;
   output                                             HPS_DDR3_WE_n;
   input                                              HPS_ENET_GTX_CLK;
   input                                              HPS_ENET_INT_n;
   output                                             HPS_ENET_MDC;
   inout                                              HPS_ENET_MDIO;
   output                                             HPS_ENET_RESET_n;
   input                                              HPS_ENET_RX_CLK;
   input [3:0] 					      HPS_ENET_RX_DATA;
   input                                              HPS_ENET_RX_DV;
   output [3:0] 				      HPS_ENET_TX_DATA;
   output                                             HPS_ENET_TX_EN;
   inout [3:0] 					      HPS_FLASH_DATA;
   output                                             HPS_FLASH_DCLK;
   output                                             HPS_FLASH_NCSO;
   input                                              HPS_GSENSOR_INT;
   inout                                              HPS_I2C_CLK;
   inout                                              HPS_I2C_SDA;
   inout [3:0] 					      HPS_KEY;
   output                                             HPS_LCM_D_C;
   output                                             HPS_LCM_RST_N;
   input                                              HPS_LCM_SPIM_CLK;
   inout                                              HPS_LCM_SPIM_MISO;
   output                                             HPS_LCM_SPIM_MOSI;
   output                                             HPS_LCM_SPIM_SS;
   output [3:0] 				      HPS_LED;
   inout                                              HPS_LTC_GPIO;
   input                                              HPS_RESET_n;
   output                                             HPS_SD_CLK;
   inout                                              HPS_SD_CMD;
   inout [3:0] 					      HPS_SD_DATA;
   output                                             HPS_SPIM_CLK;
   input                                              HPS_SPIM_MISO;
   output                                             HPS_SPIM_MOSI;
   output                                             HPS_SPIM_SS;
   input [3:0] 					      HPS_SW;
   input                                              HPS_UART_RX;
   output                                             HPS_UART_TX;
   input                                              HPS_USB_CLKOUT;
   inout [7:0] 					      HPS_USB_DATA;
   input                                              HPS_USB_DIR;
   input                                              HPS_USB_NXT;
   output                                             HPS_USB_RESET_PHY;
   output                                             HPS_USB_STP;
   input                                              HPS_WARM_RST_n;
`endif /*ENABLE_HPS*/

   ///////// HSMC /////////
   input [2:1] 					      HSMC_CLKIN_n;
   input [2:1] 					      HSMC_CLKIN_p;
   output [2:1] 				      HSMC_CLKOUT_n;
   output [2:1] 				      HSMC_CLKOUT_p;
   input                                              HSMC_CLK_IN0;
   output                                             HSMC_CLK_OUT0;
   inout [3:0] 					      HSMC_D;
`ifdef ENABLE_HSMC_XCVR
   input [7:0] 					      HSMC_GXB_RX_p;
   output [7:0] 				      HSMC_GXB_TX_p;
   input                                              HSMC_REF_CLK_p;
`endif
   inout [16:0] 				      HSMC_RX_n;
   inout [16:0] 				      HSMC_RX_p;
   output                                             HSMC_SCL;
   inout                                              HSMC_SDA;
   inout [16:0] 				      HSMC_TX_n;
   inout [16:0] 				      HSMC_TX_p;

   ///////// IRDA /////////
   input                                              IRDA_RXD;

   ///////// KEY /////////
   input [3:0] 					      KEY;

   ///////// LED /////////
   output [3:0] 				      LED;

   ///////// OSC /////////
   input                                              OSC_50_B3B;
   input                                              OSC_50_B4A;
   input                                              OSC_50_B5B;
   input                                              OSC_50_B8A;

   ///////// PCIE /////////
   input                                              PCIE_PERST_n;
   input                                              PCIE_WAKE_n;

   ///////// RESET /////////
   input                                              RESET_n;

   ///////// SI5338 /////////
   inout                                              SI5338_SCL;
   inout                                              SI5338_SDA;

   ///////// SW /////////
   input [3:0] 					      SW;

   ///////// TEMP /////////
   output                                             TEMP_CS_n;
   output                                             TEMP_DIN;
   input                                              TEMP_DOUT;
   output                                             TEMP_SCLK;

   ///////// USB /////////
   input                                              USB_B2_CLK;
   inout [7:0] 					      USB_B2_DATA;
   output                                             USB_EMPTY;
   output                                             USB_FULL;
   input                                              USB_OE_n;
   input                                              USB_RD_n;
   input                                              USB_RESET_n;
   inout                                              USB_SCL;
   inout                                              USB_SDA;
   input                                              USB_WR_n;

   ///////// VGA /////////
   output [7:0] 				      VGA_B;
   output                                             VGA_BLANK_n;
   output                                             VGA_CLK;
   output [7:0] 				      VGA_G;
   output                                             VGA_HS;
   output [7:0] 				      VGA_R;
   output                                             VGA_SYNC_n;
   output                                             VGA_VS;

   /////////hps pin///////
   output wire [14:0] 				      memory_mem_a;                          
   output wire [2:0] 				      memory_mem_ba;                         
   output wire 					      memory_mem_ck;                         
   output wire 					      memory_mem_ck_n;                       
   output wire 					      memory_mem_cke;                        
   output wire 					      memory_mem_cs_n;                       
   output wire 					      memory_mem_ras_n;                      
   output wire 					      memory_mem_cas_n;                      
   output wire 					      memory_mem_we_n;                       
   output wire 					      memory_mem_reset_n;                    
   inout  wire [31:0] 				      memory_mem_dq;                         
   inout  wire [3:0] 				      memory_mem_dqs;                        
   inout  wire [3:0] 				      memory_mem_dqs_n;                      
   output wire 					      memory_mem_odt;                        
   output wire [3:0] 				      memory_mem_dm;                         
   input  wire 					      memory_oct_rzqin;                      
   output wire 					      hps_io_hps_io_emac1_inst_TX_CLK;       
   output wire 					      hps_io_hps_io_emac1_inst_TXD0;         
   output wire 					      hps_io_hps_io_emac1_inst_TXD1;         
   output wire 					      hps_io_hps_io_emac1_inst_TXD2;         
   output wire 					      hps_io_hps_io_emac1_inst_TXD3;         
   input  wire 					      hps_io_hps_io_emac1_inst_RXD0;         
   inout  wire 					      hps_io_hps_io_emac1_inst_MDIO;         
   output wire 					      hps_io_hps_io_emac1_inst_MDC;          
   input  wire 					      hps_io_hps_io_emac1_inst_RX_CTL;       
   output wire 					      hps_io_hps_io_emac1_inst_TX_CTL;       
   input  wire 					      hps_io_hps_io_emac1_inst_RX_CLK;       
   input  wire 					      hps_io_hps_io_emac1_inst_RXD1;         
   input  wire 					      hps_io_hps_io_emac1_inst_RXD2;         
   input  wire 					      hps_io_hps_io_emac1_inst_RXD3;         
   inout  wire 					      hps_io_hps_io_qspi_inst_IO0;           
   inout  wire 					      hps_io_hps_io_qspi_inst_IO1;           
   inout  wire 					      hps_io_hps_io_qspi_inst_IO2;           
   inout  wire 					      hps_io_hps_io_qspi_inst_IO3;           
   output wire 					      hps_io_hps_io_qspi_inst_SS0;           
   output wire 					      hps_io_hps_io_qspi_inst_CLK;           
   inout  wire 					      hps_io_hps_io_sdio_inst_CMD;           
   inout  wire 					      hps_io_hps_io_sdio_inst_D0;            
   inout  wire 					      hps_io_hps_io_sdio_inst_D1;            
   output wire 					      hps_io_hps_io_sdio_inst_CLK;           
   inout  wire 					      hps_io_hps_io_sdio_inst_D2;            
   inout  wire 					      hps_io_hps_io_sdio_inst_D3;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D0;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D1;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D2;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D3;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D4;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D5;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D6;            
   inout  wire 					      hps_io_hps_io_usb1_inst_D7;            
   input  wire 					      hps_io_hps_io_usb1_inst_CLK;           
   output wire 					      hps_io_hps_io_usb1_inst_STP;           
   input  wire 					      hps_io_hps_io_usb1_inst_DIR;           
   input  wire 					      hps_io_hps_io_usb1_inst_NXT;           
   output wire 					      hps_io_hps_io_spim0_inst_CLK;          
   output wire 					      hps_io_hps_io_spim0_inst_MOSI;         
   input  wire 					      hps_io_hps_io_spim0_inst_MISO;         
   output wire 					      hps_io_hps_io_spim0_inst_SS0;          
   output wire 					      hps_io_hps_io_spim1_inst_CLK;          
   output wire 					      hps_io_hps_io_spim1_inst_MOSI;         
   input  wire 					      hps_io_hps_io_spim1_inst_MISO;         
   output wire 					      hps_io_hps_io_spim1_inst_SS0;          
   input  wire 					      hps_io_hps_io_uart0_inst_RX;           
   output wire 					      hps_io_hps_io_uart0_inst_TX;           
   inout  wire 					      hps_io_hps_io_i2c1_inst_SDA;           
   inout  wire 					      hps_io_hps_io_i2c1_inst_SCL;           
   inout  wire 					      hps_io_hps_io_gpio_inst_GPIO00;        
   //=======================================================
   //  REG/WIRE declarations
   //=======================================================

   //	For Audio CODEC
   wire 					      AUD_CTRL_CLK;	//	For Audio Controller

   reg [31:0] 					      Cont;
   wire 					      VGA_CTRL_CLK;
   wire [9:0] 					      mVGA_R;
   wire [9:0] 					      mVGA_G;
   wire [9:0] 					      mVGA_B;
   wire [19:0] 					      mVGA_ADDR;
   wire 					      DLY_RST;

   //	For VGA Controller
   wire 					      mVGA_CLK;
   wire [9:0] 					      mRed;
   wire [9:0] 					      mGreen;
   wire [9:0] 					      mBlue;
   wire 					      VGA_Read;	//	VGA data request

   wire [9:0] 					      recon_VGA_R;
   wire [9:0] 					      recon_VGA_G;
   wire [9:0] 					      recon_VGA_B;

   //	For Down Sample
   wire [3:0] 					      Remain;
   wire [9:0] 					      Quotient;

   wire 					      AUD_MUTE;

   // Drive the LEDs with the switches
   assign LED = SW;   

   // Make the FPGA reset cause an HPS reset
   reg [19:0] 					      hps_reset_counter = 20'h0;
   reg 						      hps_fpga_reset_n = 0;
   
   always @(posedge OSC_50_B4A) begin
      if (hps_reset_counter == 20'h ffffff) hps_fpga_reset_n <= 1;
      hps_reset_counter <= hps_reset_counter + 1;
   end        
      
   lab3 u0 (
            .clk_clk                               (OSC_50_B4A),                      //                 clk.clk
            .reset_reset_n                         (hps_fpga_reset_n),                 //                 reset.reset_n
            .memory_mem_a                          (memory_mem_a),                    //                 memory.mem_a
            .memory_mem_ba                         (memory_mem_ba),                   //                .mem_ba
            .memory_mem_ck                         (memory_mem_ck),                   //                .mem_ck
            .memory_mem_ck_n                       (memory_mem_ck_n),                 //                .mem_ck_n
            .memory_mem_cke                        (memory_mem_cke),                  //                .mem_cke
            .memory_mem_cs_n                       (memory_mem_cs_n),                 //                .mem_cs_n
            .memory_mem_ras_n                      (memory_mem_ras_n),                //                .mem_ras_n
            .memory_mem_cas_n                      (memory_mem_cas_n),                //                .mem_cas_n
            .memory_mem_we_n                       (memory_mem_we_n),                 //                .mem_we_n
            .memory_mem_reset_n                    (memory_mem_reset_n),              //                .mem_reset_n
            .memory_mem_dq                         (memory_mem_dq),                   //                .mem_dq
            .memory_mem_dqs                        (memory_mem_dqs),                  //                .mem_dqs
            .memory_mem_dqs_n                      (memory_mem_dqs_n),                //                .mem_dqs_n
            .memory_mem_odt                        (memory_mem_odt),                  //                .mem_odt
            .memory_mem_dm                         (memory_mem_dm),                   //                .mem_dm
            .memory_oct_rzqin                      (memory_oct_rzqin),                //                .oct_rzqin
            .hps_io_hps_io_emac1_inst_TX_CLK 		  (hps_io_hps_io_emac1_inst_TX_CLK), //    				 .hps_0_hps_io.hps_io_emac1_inst_TX_CLK
            .hps_io_hps_io_emac1_inst_TXD0   		  (hps_io_hps_io_emac1_inst_TXD0),   //                .hps_io_emac1_inst_TXD0
            .hps_io_hps_io_emac1_inst_TXD1   		  (hps_io_hps_io_emac1_inst_TXD1),   //                .hps_io_emac1_inst_TXD1
            .hps_io_hps_io_emac1_inst_TXD2   		  (hps_io_hps_io_emac1_inst_TXD2),   //                .hps_io_emac1_inst_TXD2
            .hps_io_hps_io_emac1_inst_TXD3   		  (hps_io_hps_io_emac1_inst_TXD3),   //                .hps_io_emac1_inst_TXD3
            .hps_io_hps_io_emac1_inst_RXD0   		  (hps_io_hps_io_emac1_inst_RXD0),   //                .hps_io_emac1_inst_RXD0
            .hps_io_hps_io_emac1_inst_MDIO   		  (hps_io_hps_io_emac1_inst_MDIO),   //                .hps_io_emac1_inst_MDIO
            .hps_io_hps_io_emac1_inst_MDC    		  (hps_io_hps_io_emac1_inst_MDC),    //                .hps_io_emac1_inst_MDC
            .hps_io_hps_io_emac1_inst_RX_CTL 		  (hps_io_hps_io_emac1_inst_RX_CTL), //                .hps_io_emac1_inst_RX_CTL
            .hps_io_hps_io_emac1_inst_TX_CTL 		  (hps_io_hps_io_emac1_inst_TX_CTL), //                .hps_io_emac1_inst_TX_CTL
            .hps_io_hps_io_emac1_inst_RX_CLK 		  (hps_io_hps_io_emac1_inst_RX_CLK), //                .hps_io_emac1_inst_RX_CLK
            .hps_io_hps_io_emac1_inst_RXD1   		  (hps_io_hps_io_emac1_inst_RXD1),   //                .hps_io_emac1_inst_RXD1
            .hps_io_hps_io_emac1_inst_RXD2   		  (hps_io_hps_io_emac1_inst_RXD2),   //                .hps_io_emac1_inst_RXD2
            .hps_io_hps_io_emac1_inst_RXD3   		  (hps_io_hps_io_emac1_inst_RXD3),   //                .hps_io_emac1_inst_RXD3
            .hps_io_hps_io_qspi_inst_IO0     		  (hps_io_hps_io_qspi_inst_IO0),     //                .hps_io_qspi_inst_IO0
            .hps_io_hps_io_qspi_inst_IO1     		  (hps_io_hps_io_qspi_inst_IO1),     //                .hps_io_qspi_inst_IO1
            .hps_io_hps_io_qspi_inst_IO2     		  (hps_io_hps_io_qspi_inst_IO2),     //                .hps_io_qspi_inst_IO2
            .hps_io_hps_io_qspi_inst_IO3     		  (hps_io_hps_io_qspi_inst_IO3),     //                .hps_io_qspi_inst_IO3
            .hps_io_hps_io_qspi_inst_SS0     		  (hps_io_hps_io_qspi_inst_SS0),     //                .hps_io_qspi_inst_SS0
            .hps_io_hps_io_qspi_inst_CLK     		  (hps_io_hps_io_qspi_inst_CLK),     //                .hps_io_qspi_inst_CLK
            .hps_io_hps_io_sdio_inst_CMD     		  (hps_io_hps_io_sdio_inst_CMD),     //                .hps_io_sdio_inst_CMD
            .hps_io_hps_io_sdio_inst_D0     		  (hps_io_hps_io_sdio_inst_D0),      //                .hps_io_sdio_inst_D0
            .hps_io_hps_io_sdio_inst_D1      		  (hps_io_hps_io_sdio_inst_D1),      //                .hps_io_sdio_inst_D1
            .hps_io_hps_io_sdio_inst_CLK    		  (hps_io_hps_io_sdio_inst_CLK),     //                .hps_io_sdio_inst_CLK
            .hps_io_hps_io_sdio_inst_D2   		  (hps_io_hps_io_sdio_inst_D2),      //                .hps_io_sdio_inst_D2
            .hps_io_hps_io_sdio_inst_D3      		  (hps_io_hps_io_sdio_inst_D3),      //                .hps_io_sdio_inst_D3
            .hps_io_hps_io_usb1_inst_D0      		  (hps_io_hps_io_usb1_inst_D0),      //                .hps_io_usb1_inst_D0
            .hps_io_hps_io_usb1_inst_D1      		  (hps_io_hps_io_usb1_inst_D1),      //                .hps_io_usb1_inst_D1
            .hps_io_hps_io_usb1_inst_D2     		  (hps_io_hps_io_usb1_inst_D2),      //                .hps_io_usb1_inst_D2
            .hps_io_hps_io_usb1_inst_D3     		  (hps_io_hps_io_usb1_inst_D3),      //                .hps_io_usb1_inst_D3
            .hps_io_hps_io_usb1_inst_D4     		  (hps_io_hps_io_usb1_inst_D4),      //                .hps_io_usb1_inst_D4
            .hps_io_hps_io_usb1_inst_D5      		  (hps_io_hps_io_usb1_inst_D5),      //                .hps_io_usb1_inst_D5
            .hps_io_hps_io_usb1_inst_D6     		  (hps_io_hps_io_usb1_inst_D6),      //                .hps_io_usb1_inst_D6
            .hps_io_hps_io_usb1_inst_D7     		  (hps_io_hps_io_usb1_inst_D7),      //                .hps_io_usb1_inst_D7
            .hps_io_hps_io_usb1_inst_CLK    		  (hps_io_hps_io_usb1_inst_CLK),     //                .hps_io_usb1_inst_CLK
            .hps_io_hps_io_usb1_inst_STP    		  (hps_io_hps_io_usb1_inst_STP),     //                .hps_io_usb1_inst_STP
            .hps_io_hps_io_usb1_inst_DIR    		  (hps_io_hps_io_usb1_inst_DIR),     //                .hps_io_usb1_inst_DIR
            .hps_io_hps_io_usb1_inst_NXT    		  (hps_io_hps_io_usb1_inst_NXT),     //                .hps_io_usb1_inst_NXT
            .hps_io_hps_io_spim0_inst_CLK   		  (hps_io_hps_io_spim0_inst_CLK),    //                .hps_io_spim0_inst_CLK
            .hps_io_hps_io_spim0_inst_MOSI  		  (hps_io_hps_io_spim0_inst_MOSI),   //                .hps_io_spim0_inst_MOSI
            .hps_io_hps_io_spim0_inst_MISO  		  (hps_io_hps_io_spim0_inst_MISO),   //                .hps_io_spim0_inst_MISO
            .hps_io_hps_io_spim0_inst_SS0   		  (hps_io_hps_io_spim0_inst_SS0),    //                .hps_io_spim0_inst_SS0
            .hps_io_hps_io_spim1_inst_CLK   		  (hps_io_hps_io_spim1_inst_CLK),    //                .hps_io_spim1_inst_CLK
            .hps_io_hps_io_spim1_inst_MOSI  		  (hps_io_hps_io_spim1_inst_MOSI),   //                .hps_io_spim1_inst_MOSI
            .hps_io_hps_io_spim1_inst_MISO  		  (hps_io_hps_io_spim1_inst_MISO),   //                .hps_io_spim1_inst_MISO
            .hps_io_hps_io_spim1_inst_SS0    	 	  (hps_io_hps_io_spim1_inst_SS0),    //                .hps_io_spim1_inst_SS0
            .hps_io_hps_io_uart0_inst_RX     		  (hps_io_hps_io_uart0_inst_RX),     //                .hps_io_uart0_inst_RX
            .hps_io_hps_io_uart0_inst_TX     		  (hps_io_hps_io_uart0_inst_TX),     //                .hps_io_uart0_inst_TX
            .hps_io_hps_io_i2c1_inst_SDA     		  (hps_io_hps_io_i2c1_inst_SDA),     //                .hps_io_i2c1_inst_SDA
            .hps_io_hps_io_i2c1_inst_SCL     		  (hps_io_hps_io_i2c1_inst_SCL)      //                .hps_io_i2c1_inst_SCL
	    );

endmodule
