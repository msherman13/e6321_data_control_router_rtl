onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /data_bus_controller_tb/clk
add wave -noupdate -format Logic /data_bus_controller_tb/fft_enable
add wave -noupdate -format Logic /data_bus_controller_tb/to_fft_empty
add wave -noupdate -format Logic /data_bus_controller_tb/to_fft_full
add wave -noupdate -format Logic /data_bus_controller_tb/from_fft_empty
add wave -noupdate -format Logic /data_bus_controller_tb/from_fft_full
add wave -noupdate -format Literal -radix binary /data_bus_controller_tb/fft_data_in
add wave -noupdate -format Literal -radix binary /data_bus_controller_tb/fft_data_out
add wave -noupdate -format Literal -radix binary /data_bus_controller_tb/data_bus

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
