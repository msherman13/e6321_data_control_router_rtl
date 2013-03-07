module filt_address_calc (offset, filesize, enable, pause, clk, addr, done);
	input [31:0] offset, filesize;
	input enable, pause, clk;
	output [31:0] addr;
	output done;
	
	wire [31:0] count;

	counter1 counter (.filesize(filesize),.enable(enable), .pause(pause), .clk(clk),.count(count), .done(done));
	
	adder32b adder (.a(offset), .b(count), .clk(clk), .s(addr));
	
endmodule
