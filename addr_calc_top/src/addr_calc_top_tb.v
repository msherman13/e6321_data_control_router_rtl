/******************************************************************************
**
** Module:      addr_calc_top_tb
** Description: Testbench for address calculation.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/08/2013
**
******************************************************************************/

`define half_clk_period #25000
`define SD #1000

module addr_calc_top_tb();


reg [31:0] offset, filesize;
reg clk, fft_enable, fir_enable, iir_enable, fft_read_pause, fft_write_pause, fir_read_pause, fir_write_pause, iir_read_pause, iir_write_pause;
wire [31:0] addr;
wire fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done;
integer i;

addr_calc_top addr_calc (.offset(offset), .filesize(filesize), .fft_enable(fft_enable), .fir_enable(fir_enable), .iir_enable(iir_enable), .fft_read_pause(fft_read_pause), .fir_read_pause(fir_read_pause), .iir_read_pause(iir_read_pause), .fft_write_pause(fft_write_pause), .fir_write_pause(fir_write_pause), .iir_write_pause(iir_write_pause), .clk(clk), .addr(addr), .fft_read_done(fft_read_done), .fft_write_done(fft_write_done), .fir_read_done(fir_read_done), .fir_write_done(fir_write_done), .iir_read_done(iir_read_done), .iir_write_done(iir_write_done));

   always begin
	`half_clk_period;
	clk = ~clk;
   end

   initial begin
	clk <= 1;
	offset <= 10;
	filesize <= 100;
	fft_enable <= 0;
	fir_enable <= 0;
	iir_enable <= 0;
	@(posedge clk);

	//Test FFT addr calc.
	fft_enable <= 1;
	fft_read_pause <= 0;//Address calc to give data to FFT.
	fft_write_pause <= 1;
	for (i = 0; i < 25; i = i+1)
	begin
		@(posedge clk);
	end

	fft_read_pause <= 1;//Read & write both paused.
	fft_write_pause <= 1;
	for (i = 0; i < 25; i = i+1)//Pause for 25 cycles to verify hi-Z.
	begin
		@(posedge clk);
	end

	fft_read_pause <= 1;//Address calc to get data from FFT.
	fft_write_pause <= 0;
	for (i = 0; i < 125; i = i+1)
	begin
		@(posedge clk);
	end

	fft_read_pause <= 1;//Read & write both paused.
	fft_write_pause <= 1;
	for (i = 0; i < 200; i = i+1)//Pause for 200 cycles to verify hi-Z.
	begin
		@(posedge clk);
	end

	fft_read_pause <= 0;//Address calc to give data to FFT.
	fft_write_pause <= 1;
	for (i = 0; i < 100; i = i+1)
	begin
		@(posedge clk);
	end

	$finish;
   end 
endmodule
