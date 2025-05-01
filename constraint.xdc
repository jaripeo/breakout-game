# ================== Clock ==================
set_property PACKAGE_PIN E3 [get_ports ClkPort]
set_property IOSTANDARD LVCMOS33 [get_ports ClkPort]
create_clock -add -name ClkPort -period 10.00 [get_ports ClkPort]

# ================== Push Buttons ==================
set_property PACKAGE_PIN N17 [get_ports BtnC]  ;# Center
set_property IOSTANDARD LVCMOS33 [get_ports BtnC]

set_property PACKAGE_PIN P17 [get_ports BtnL]  ;# Left
set_property IOSTANDARD LVCMOS33 [get_ports BtnL]

set_property PACKAGE_PIN M17 [get_ports BtnR]  ;# Right
set_property IOSTANDARD LVCMOS33 [get_ports BtnR]

set_property PACKAGE_PIN M18 [get_ports BtnU]  ;# Right
set_property IOSTANDARD LVCMOS33 [get_ports BtnU]

# ================== VGA Red ==================
set_property PACKAGE_PIN A3 [get_ports {vgaR[0]}]
set_property PACKAGE_PIN B4 [get_ports {vgaR[1]}]
set_property PACKAGE_PIN C5 [get_ports {vgaR[2]}]
set_property PACKAGE_PIN A4 [get_ports {vgaR[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaR[*]}]

# ================== VGA Green ==================
set_property PACKAGE_PIN C6 [get_ports {vgaG[0]}]
set_property PACKAGE_PIN A5 [get_ports {vgaG[1]}]
set_property PACKAGE_PIN B6 [get_ports {vgaG[2]}]
set_property PACKAGE_PIN A6 [get_ports {vgaG[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaG[*]}]

# ================== VGA Blue ==================
set_property PACKAGE_PIN B7 [get_ports {vgaB[0]}]
set_property PACKAGE_PIN C7 [get_ports {vgaB[1]}]
set_property PACKAGE_PIN D7 [get_ports {vgaB[2]}]
set_property PACKAGE_PIN D8 [get_ports {vgaB[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaB[*]}]

# ================== VGA Sync ==================
set_property PACKAGE_PIN B11 [get_ports hSync]
set_property IOSTANDARD LVCMOS33 [get_ports hSync]

set_property PACKAGE_PIN B12 [get_ports vSync]
set_property IOSTANDARD LVCMOS33 [get_ports vSync]

# ================== 7-Segment Cathodes ==================
#7 segment display
#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = Ca
set_property PACKAGE_PIN T10 [get_ports {Ca}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ca}]
#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = Cb
set_property PACKAGE_PIN R10 [get_ports {Cb}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cb}]
#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = Cc
set_property PACKAGE_PIN K16 [get_ports {Cc}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cc}]
#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = Cd
set_property PACKAGE_PIN K13 [get_ports {Cd}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cd}]
#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = Ce
set_property PACKAGE_PIN P15 [get_ports {Ce}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ce}]
#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = Cf
set_property PACKAGE_PIN T11 [get_ports {Cf}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cf}]
#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = Cg
set_property PACKAGE_PIN L18 [get_ports {Cg}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cg}]

#Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = Dp
set_property PACKAGE_PIN H15 [get_ports Dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports Dp]

# ================== 7-Segment Anodes ==================
set_property PACKAGE_PIN J17 [get_ports {An0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An0}]
#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = An1
set_property PACKAGE_PIN J18 [get_ports {An1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An1}]
#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = An2
set_property PACKAGE_PIN T9 [get_ports {An2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An2}]
#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = An3
set_property PACKAGE_PIN J14 [get_ports {An3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An3}]
#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = An4
set_property PACKAGE_PIN P14 [get_ports {An4}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An4}]
#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = An5
set_property PACKAGE_PIN T14 [get_ports {An5}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An5}]
#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = An6
set_property PACKAGE_PIN K2 [get_ports {An6}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An6}]
#Bank = 34, Pin name = IO_L1N_T034,							Sch name = An7
set_property PACKAGE_PIN U13 [get_ports {An7}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {An7}]


set_property PACKAGE_PIN J15 [get_ports {DifficultySwitch[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DifficultySwitch[0]}]

set_property PACKAGE_PIN L16 [get_ports {DifficultySwitch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DifficultySwitch[1]}]


# Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = Sw0
set_property PACKAGE_PIN J15 [get_ports {Sw0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw0}]
#Bank = 34, Pin name = IO_25_34,							Sch name = Sw1
set_property PACKAGE_PIN L16 [get_ports {Sw1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw1}]
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = Sw2
set_property PACKAGE_PIN M13 [get_ports {Sw2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw2}]
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = Sw3
set_property PACKAGE_PIN R15 [get_ports {Sw3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw3}]
#Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = Sw4
set_property PACKAGE_PIN R17 [get_ports {Sw4}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw4}]
#Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = Sw5
set_property PACKAGE_PIN T18 [get_ports {Sw5}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw5}]
#Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = Sw6
set_property PACKAGE_PIN U18 [get_ports {Sw6}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Sw6}]