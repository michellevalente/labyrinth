#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 13.1.1 Build 166 11/26/2013 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "clock1" -period 20.000ns [get_ports {OSC_50_B3B}]
create_clock -name "clock2" -period 20.000ns [get_ports {OSC_50_B4A}]
create_clock -name "clock3" -period 20.000ns [get_ports {OSC_50_B5B}]
create_clock -name "clock4" -period 20.000ns [get_ports {OSC_50_B8A}]


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

# tsu/th constraints

# tco constraints

# tpd constraints

