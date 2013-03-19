/******************************************************************************
**
** Module:      dc_router_top_tb
** Description: Testbench for top level of data & control router module.
**
** Author:      Miles Sherman
** Contact:     ms4543@columbia.edu
** Affiliation: Columbia University
**
** Last Update: 03/18/2013
**
******************************************************************************/

`define half_clk_period #25000
`define SD #1000

//Module declaration.
module dc_router_top_tb();

//Wire & reg declarations.
reg clk, reset, to_fft_full, to_fft_empty, from_fft_full, from_fft_empty, to_fir_full, to_fir_empty, from_fir_full, from_fir_empty, to_iir_full, to_iir_empty, from_iir_full, from_iir_empty;
reg [31:0] instruction, offset, filesize;
reg [127:0] fft_data_in, fir_data_in, iir_data_in;

wire acc_done, fft_enable, fir_enable, iir_enable, fft_put_req, fft_get_req, fir_put_req, fir_get_req, iir_put_req, iir_get_req, ram_read_enable, ram_write_enable;
wire [31:0] addr;
wire [127:0] fft_data_out, fir_data_out, iir_data_out;
wire [127:0] data_bus;

//MUT instantiation.
module dc_router_top (.clk(clk), .reset(reset), .instruction(instruction), .offset(offset), .filesize(filesize), .acc_done(acc_done), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .data_bus(data_bus), .fft_data_in(fft_data_in), .fir_data_in(fir_data_in), .iir_data_in(iir_data_in), .fft_data_out(fft_data_out), .fir_data_out(fir_data_out), .iir_data_out(iir_data_out), .to_fft_empty(to_fft_empty), .to_fft_full(to_fft_full), .from_fft_empty(from_fft_empty), .from_fft_full(from_fft_full), .to_fir_empty(to_fir_empty), .to_fir_full(to_fir_full), .from_fir_empty(from_fir_empty), .from_fir_full(from_fir_full), .to_iir_empty(to_iir_empty), .to_iir_full(to_iir_full), .from_iir_empty(from_iir_empty), .from_iir_full(from_iir_full), .fft_put_req(fft_put_req), .fft_get_req(fft_get_req), .fir_put_req(fir_put_req), .fir_get_req(fir_get_req), .iir_put_req(iir_put_req), .iir_get_req(iir_get_req), .ram_read_enable(ram_read_enable), .ram_write_enable(ram_write_enable), .addr(addr));

//Clock generation.
always
begin
	`half_clk_period;
	clk = ~clk;
end

//Begin test vector input.
initial
begin
	//Initialize inputs.
	clk = 0;
	reset = 0;
    to_fft_full = 0;
    to_fft_empty = 0;
    from_fft_full = 0;
    from_fft_empty = 0;
    to_fir_full = 0;
    to_fir_empty = 0;
    from_fir_full = 0;
    from_fir_empty = 0;
    to_iir_full = 0;
    to_iir_empty = 0;
    from_iir_full = 0;
    from_iir_empty = 0;
    instruction = 0;
    offset = 0;
    filesize = 0;
    fft_data_in = 0;
    fir_data_in = 0;
    iir_data_in = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	//Begin FFT Testing.
	instruction = 2'b01;
    offset = 100;
    filesize = 5;
	@(posedge clk);
    to_fft_full = 1;
	@(posedge clk);
    to_fft_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
    from_fft_full = 1;
	@(posedge clk);
    
    
	fft_read_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	fft_write_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	//Begin FIR Testing.
	instruction = 2'b10;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	fir_read_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	fir_write_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	//Begin IIR Testing.
	instruction = 2'b11;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	iir_read_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	iir_write_done = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	$finish;
end 
endmodule
