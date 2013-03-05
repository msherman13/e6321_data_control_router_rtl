module adder32b (a, b, clk, s);
	input [31:0] a;
	input [31:0] b;
	input clk;
	output [31:0] s;


	assign s = a + b;

endmodule
