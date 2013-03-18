/******************************************************************************
**
** Module:      data_bus_controller_tb
** Description: Testbench for data bus controller within data & control router.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/07/2013
**
******************************************************************************/

`define half_clk_period #25000
`define SD #1000

module pla_top_tb();

reg [31:0] data_bus_reg;
reg [31:0] fft_data_in, fir_data_in, iir_data_in;
reg to_fft_empty, to_fft_full, from_fft_empty, from_fft_full, to_fir_empty, to_fir_full, from_fir_empty, from_fir_full, to_iir_empty, to_iir_full, from_iir_empty, from_iir_full, fft_enable, fir_enable, iir_enable, clk;
wire [31:0] fft_data_out, fir_data_out, iir_data_out;
wire data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir;
wire [31:0] data_bus;

data_bus_controller data_cntl (.data_bus(data_bus), .fft_data_in(fft_data_in), .fir_data_in(fir_data_in), .iir_data_in(iir_data_in), .fft_data_out(fft_data_out), .fir_data_out(fir_data_out), .iir_data_out(iir_data_out), .to_fft_empty(to_fft_empty), .to_fft_full(to_fft_full), .from_fft_empty(from_fft_empty), .from_fft_full(from_fft_full), .to_fir_empty(to_fir_empty), .to_fir_full(to_fir_full), .from_fir_empty(from_fir_empty), .from_fir_full(from_fir_full), .to_iir_empty(to_iir_empty), .to_iir_full(to_iir_full), .from_iir_empty(from_iir_empty), .from_iir_full(from_iir_full), .data_to_fft(data_to_fft), .data_from_fft(data_from_fft), .data_to_fir(data_to_fir), .data_from_fir(data_from_fir), .data_to_iir(data_to_iir), .data_from_iir(data_from_iir), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .clk(clk));

assign data_bus = data_bus_reg;

   always begin
	`half_clk_period;
	clk = ~clk;
   end

   initial begin
	//Initialize inputs.
	clk = 0;
	fft_data_in = 0;
	fir_data_in = 0;
	iir_data_in = 0;
	to_fft_empty = 1;
	to_fft_full = 0;
	from_fft_empty = 1;
	from_fft_full = 0;
	to_fir_empty = 1;
	to_fir_full = 0;
	from_fir_empty = 1;
	from_fir_full = 0;
	to_fir_empty = 1;
	to_fir_full = 0;
	from_fir_empty = 1;
	from_fir_full = 0;
	fft_enable = 0;
	fir_enable = 0;
	iir_enable = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	//Begin FFT Testing.
	fft_enable = 1;
	data_bus_reg = 32'b01010101010101010101010101010101;
	fft_data_in = 32'b10101010101010101010101010101010;//data_bus->data_out
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0010;//data_bus -> data_out
	@(posedge clk);
	data_bus_reg = 32'bZ;
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0110;//data_bus, data_out hi-Z
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0100;//data_in -> data_out
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0101;//data_in -> data_out
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b1001;//data_in -> data_out
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0000;//data_in -> data_out
	@(posedge clk);
	{to_fft_empty, to_fft_full, from_fft_empty, from_fft_full} = 4'b0110;//data_bus, data_out hi-Z
	@(posedge clk);

	$finish;
   end 
endmodule
