/******************************************************************************
**
** Module:      shifter2b
** Description: Arithmetic 2-bit shifter.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/08/2013
**
******************************************************************************/

module shifter2b (in, clk, out);
input [31:0] in;
input clk;
output [31:0] out;

	assign out = in << 2;

endmodule
