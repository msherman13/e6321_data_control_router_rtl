/******************************************************************************
**
** Module:      dc_router_top
** Description: Top level of data & control router.
**
** Author:      Miles Sherman
** Contact:     ms4543@columbia.edu
** Affiliation: Columbia University
**
** Last Update: 03/18/2013
**
******************************************************************************/

//Module declaration.
module dc_router_top (clk, reset, instruction, offset, filesize, acc_done, fft_enable, fir_enable, iir_enable, data_bus, fft_data_in, fir_data_in, iir_data_in, fft_data_out, fir_data_out, iir_data_out, to_fft_empty, to_fft_full, from_fft_empty, from_fft_full, to_fir_empty, to_fir_full, from_fir_empty, from_fir_full, to_iir_empty, to_iir_full, from_iir_empty, from_iir_full, fft_put_req, fft_get_req, fir_put_req, fir_get_req, iir_put_req, iir_get_req, ram_read_enable, ram_write_enable, addr);

//Terminal declarations.
input clk, reset, to_fft_full, to_fft_empty, from_fft_full, from_fft_empty, to_fir_full, to_fir_empty, from_fir_full, from_fir_empty, to_iir_full, to_iir, empty, from_iir_full, from_iir_empty;
input [31:0] instruction, offset, filesize;
input [127:0] fft_data_in, fir_data_in, iir_data_in;

output acc_done, fft_enable, fir_enable, iir_enable, fft_put_req, fft_get_req, fir_put_req, fir_get_req, iir_put_req, iir_get_req, ram_read_enable, ram_write_enable;
output [31:0] addr;

inout [127:0] data_bus;

//Wire & reg declarations.
wire fft_read_pause, fft_write_pause, fir_read_pause, fir_write_pause, iir_read_pause, iir_write_pause, data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done;

//Address pause signal generation.
assign fft_read_pause = !data_to_fft;
assign fft_write_pause = !data_from_fft;

assign fir_read_pause = !data_to_fir;
assign fir_write_pause = !data_from_fir;

assign iir_read_pause = !data_to_iir;
assign iir_write_pause = !data_from_iir;

//Sub-module instantiation.
pla_top pla_top (.instruction(instruction), .fft_read_done(fft_read_done), .fft_write_done(fft_write_done), .fir_read_done(fir_read_done), .fir_write_done(fir_write_done), .iir_read_done(iir_read_done), .iir_write_done(iir_write_done), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .acc_done(acc_done), .clk(clk), .reset(reset));

addr_calc_top addr_calc (.offset(offset), .filesize(filesize), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .fft_read_pause(fft_read_pause), .fir_read_pause(fir_read_pause), .iir_read_pause(iir_read_pause), .fft_write_pause(fft_write_pause), .fir_write_pause(fir_write_pause), .iir_write_pause(iir_write_pause), .clk(clk), .addr(addr), .fft_read_done(fft_read_done), .fft_write_done(fft_write_done), .fir_read_done(fir_read_done), .fir_write_done(fir_write_done), .iir_read_done(iir_read_done), .iir_write_done(iir_write_done));

data_bus_controller data_cntl (.data_bus(data_bus), .fft_data_in(fft_data_in), .fir_data_in(fir_data_in), .iir_data_in(iir_data_in), .fft_data_out(fft_data_out), .fir_data_out(fir_data_out), .iir_data_out(iir_data_out), .to_fft_empty(to_fft_empty), .to_fft_full(to_fft_full), .from_fft_empty(from_fft_empty), .from_fft_full(from_fft_full), .to_fir_empty(to_fir_empty), .to_fir_full(to_fir_full), .from_fir_empty(from_fir_empty), .from_fir_full(from_fir_full), .to_iir_empty(to_iir_empty), .to_iir_full(to_iir_full), .from_iir_empty(from_iir_empty), .from_iir_full(from_iir_full), .data_to_fft(data_to_fft), .data_from_fft(data_from_fft), .data_to_fir(data_to_fir), .data_from_fir(data_from_fir), .data_to_iir(data_to_iir), .data_from_iir(data_from_iir), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .clk(clk));

endmodule
