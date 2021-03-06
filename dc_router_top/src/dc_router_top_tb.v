/******************************************************************************
**
** Module:      dc_router_top_tb
** Description: Testbench for top level of data & control router module.
**
** Author:      Miles Sherman
** Contact:     ms4543@columbia.edu
** Affiliation: Columbia University
**
** Last Update: 03/192013
**
******************************************************************************/

`define half_clk_period #25000
`define SD #1000

//Module declaration.
module dc_router_top_tb();

//Wire & reg declarations.
reg clk, reset, to_fft_full, to_fft_empty, from_fft_full, from_fft_empty, to_fir_full, to_fir_empty, from_fir_full, from_fir_empty;
reg [31:0] instruction, offset, filesize;
reg [31:0] fft_data_in, fir_data_in;

wire acc_done, fft_enable, fir_enable, fft_put_req, fft_get_req, fir_put_req, fir_get_req, ram_read_enable, ram_write_enable;
wire [31:0] addr;
wire [31:0] fft_data_out, fir_data_out;
wire [31:0] data_bus;
reg [31:0] data_bus_reg;

//MUT instantiation.
dc_router_top dc_router_top (.clk(clk), .reset(reset), .instruction(instruction), .offset(offset), .filesize(filesize), .acc_done(acc_done), .fft_enable(fft_enable), .fir_enable(fir_enable), .data_bus(data_bus), .fft_data_in(fft_data_in), .fir_data_in(fir_data_in), .fft_data_out(fft_data_out), .fir_data_out(fir_data_out), .to_fft_empty(to_fft_empty), .to_fft_full(to_fft_full), .from_fft_empty(from_fft_empty), .from_fft_full(from_fft_full), .to_fir_empty(to_fir_empty), .to_fir_full(to_fir_full), .from_fir_empty(from_fir_empty), .from_fir_full(from_fir_full), .fft_put_req(fft_put_req), .fft_get_req(fft_get_req), .fir_put_req(fir_put_req), .fir_get_req(fir_get_req), .ram_read_enable(ram_read_enable), .ram_write_enable(ram_write_enable), .addr(addr));

//Data-bus bi-directional handling.
assign data_bus = data_bus_reg;

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
    	to_fft_empty = 1;
    	from_fft_full = 0;
    	from_fft_empty = 1;
    	to_fir_full = 0;
    	to_fir_empty = 1;
    	from_fir_full = 0;
    	from_fir_empty = 1;
    	instruction = 0;
    	offset = 0;
    	filesize = 0;
    	fft_data_in = 0;
    	fir_data_in = 0;
	data_bus_reg = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	
	//Begin FFT Testing.
	instruction = 2'b01;
    	offset = 100;
    	filesize = 40;
	data_bus_reg = 122;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	to_fft_empty = 0;
    	to_fft_full = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
    	to_fft_full = 1;
	to_fft_empty = 0;
	@(posedge clk);
    	to_fft_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	from_fft_empty = 0;
    	from_fft_full = 1;
	fft_data_in = 123;
	data_bus_reg = 32'bZ;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
    	from_fft_full = 0;
	to_fft_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	data_bus_reg = 122;
	to_fft_empty = 1;
	to_fft_full = 0;
	from_fft_empty = 1;
	from_fft_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	data_bus_reg = 32'bZ;
	from_fft_full = 1;
	from_fft_empty = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	instruction = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	//Begin FIR Testing.
	instruction = 2'b10;
    	offset = 100;
    	filesize = 40;
	data_bus_reg = 122;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	to_fir_empty = 0;
    	to_fir_full = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
    	to_fir_full = 1;
	to_fir_empty = 0;
	@(posedge clk);
    	to_fir_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	from_fir_empty = 0;
    	from_fir_full = 1;
	fir_data_in = 123;
	data_bus_reg = 32'bZ;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
    	from_fir_full = 0;
	to_fir_full = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	from_fir_full = 1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	instruction = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	$finish;
end 
endmodule
