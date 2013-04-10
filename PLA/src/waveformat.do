onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /pla_top_tb/clk
add wave -noupdate -format Logic /pla_top_tb/fft_enable
add wave -noupdate -format Logic /pla_top_tb/fir_enable
add wave -noupdate -format Logic /pla_top_tb/iir_enable
add wave -noupdate -format Logic /pla_top_tb/acc_done
add wave -noupdate -format Logic /pla_top_tb/instruction
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7378 ps} 0}
WaveRestoreZoom {0 ps} {47250 ps}
configure wave -namecolwidth 223
configure wave -valuecolwidth 89
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
