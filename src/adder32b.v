module adder32b
#(parameter width=32)
(
	input [width-1:0] a,
	input [width-1:0] b,
	input cin,
	output [width-1:0] s,
	output cout,
);

reg s, cout;

	assign s = a + b + cin;
endmodule
