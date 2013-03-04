module counter1_4
#(parameter width=32)
(
	input [width-1:0] filesize,
	input clk,
	input reset,
	output [width-1:0] count,
);

reg[width-1:0] count;
wire clk;

always @(posedge clk)
begin
	if (count != filesize)
end

	assign s = a + b + cin;
endmodule








// Quartus II Verilog Template
// Binary counter

module binary_counter
#(parameter WIDTH=64)
(
	input clk, enable, reset,
	output reg [WIDTH-1:0] count
);

	// Reset if needed, or increment if counting is enabled
	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			count <= 0;
		else if (enable == 1'b1)
			count <= count + 1;
	end

endmodule
