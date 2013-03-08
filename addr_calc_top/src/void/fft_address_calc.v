/******************************************************************************
**
** Module:      fftfilt_address_calc
** Description: Top level of address calculation for 4by4 word accelerators.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/08/2013
**
******************************************************************************/

module fft_address_calc (offset, filesize, enable, pause, clk, addr, done);
	input [31:0] offset, filesize;
	input enable, clk;
	output [31:0] addr;
	output done;
	
	wire [31:0] count, shiftout;

	counter1_4 counter (.filesize(filesize),.enable(enable), .pause(pause), .clk(clk),.count(count), .done(done));
	
	shifter2b shifter (.in(count), .clk(clk), .out(shiftout));
	
	adder32b adder (.a(offset), .b(shiftout), .clk(clk), .s(addr));
	
endmodule
