module filt_address_calc (offset, filesize, enable, clk, addr, done);
	input [31:0] offset, filesize;
	input enable, clk;
	output [31:0] addr;
	output done;
	
	wire [31:0] count;

	counter1 counter (.filesize(filesize),.enable(enable),.clk(clk),.count(count), .done(done));
	
	adder32b adder (.a(offset), .b(count), .clk(clk), .s(addr));
	
endmodule
