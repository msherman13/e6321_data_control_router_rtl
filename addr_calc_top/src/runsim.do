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
vlog -incr adder32b.v
vlog -incr addr_calc_top_tb.v
vlog -incr addr_calc_top.v
vlog -incr filt_address_calc.v 
vlog -incr filt_filesize_counter.v 
vlog -incr fft_out_filesize_counter.v
vlog -incr fft_out_address_calc.v

# Run Simulator 
vsim -t ps -lib work addr_calc_top_tb 
do waveformat.do   
run -all
#while {[exa testend_s] == "false"} {run 0.20 ms}
#quit -sim	 
