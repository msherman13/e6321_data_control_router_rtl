#-----------------------------------------------------------------------------#
#                                                                             #
#                         M A C R O    F I L E                                #
#                          COPYRIGHT (C) 2006                                 #
#                                                                             #
#-----------------------------------------------------------------------------#
#-
#- Title       : RUNSIM.DO
#- Design      : MDCT Core
#- Author      : Mingoo Seok 
#-
#-----------------------------------------------------------------------------
#-
#- File        : RUNSIM.DO
#- Created     : Sat Mar 5 2006
#-
#-----------------------------------------------------------------------------
#-
#-  Description : ModelSim macro for running simulation
#-
#-----------------------------------------------------------------------------

vlib work 
vmap work work

# Include Netlist and Testbench
#vlog -incr /tools2/courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt.v
vlog -incr  
vlog -incr dc_router_top_tb.v
vlog -incr dc_router_top.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/adder32b.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/filt_address_calc.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/filt_filesize_counter.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/addr_calc_top.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/data_bus_cntl_full_empty/src/data_bus_controller.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/PLA/src/pla_top.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/fft_out_address_calc.v
vlog -incr /user4/spring13/ms4543/E6321/Project/data_control_router_rtl/addr_calc_top/src/fft_out_filesize_counter.v

# Run Simulator 
vsim -t ps -lib work dc_router_top_tb
do waveformat.do   
run -all
#while {[exa testend_s] == "false"} {run 0.20 ms}
#quit -sim
