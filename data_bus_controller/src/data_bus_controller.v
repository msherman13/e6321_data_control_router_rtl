/******************************************************************************
**
** Module:      data_bus_controller
** Description: Tri-state logic to control data i/o between accelerators & RAM.
**		data_in means data coming into router.
**		data_out means data going out of router.
**		to_accelerator means data going from router to acc. FIFO.
**		from_accelerator means data coming from acc. FIFO to router.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/07/2013
**
******************************************************************************/


module data_bus_controller (data_bus, fft_data_in, fir_data_in, iir_data_in, fft_data_out, fir_data_out, iir_data_out, to_fft_empty, to_fft_full, from_fft_empty, from_fft_full, to_fir_empty, to_fir_full, from_fir_empty, from_fir_full, to_iir_empty, to_iir_full, from_iir_empty, from_iir_full, data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir, fft_enable, fir_enable, iir_enable, clk);

inout [31:0] data_bus;

input [31:0] fft_data_in, fir_data_in, iir_data_in;
input to_fft_empty, to_fft_full, from_fft_empty, from_fft_full, to_fir_empty, to_fir_full, from_fir_empty, from_fir_full, to_iir_empty, to_iir_full, from_iir_empty, from_iir_full, fft_enable, fir_enable, iir_enable, clk;

output [31:0] fft_data_out, fir_data_out, iir_data_out;
output data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir;

reg data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir;
	
always @(posedge clk)
begin

	//FSM for FFT enable.
	if (fft_enable)
	begin
		case ({to_fft_empty, to_fft_full, from_fft_empty, from_fft_full})
		4'b0000: {data_to_fft, data_from_fft} <= 2'b01;
		4'b0001: {data_to_fft, data_from_fft} <= 2'b01;
		4'b0010: {data_to_fft, data_from_fft} <= 2'b10;
		4'b0100: {data_to_fft, data_from_fft} <= 2'b01;
		4'b0101: {data_to_fft, data_from_fft} <= 2'b01;
		4'b0110: {data_to_fft, data_from_fft} <= 2'b00;
		4'b1000: {data_to_fft, data_from_fft} <= 2'b10;
		4'b1001: {data_to_fft, data_from_fft} <= 2'b01;
		4'b1010: {data_to_fft, data_from_fft} <= 2'b10;
		endcase
		data_to_fir <= 0;
		data_from_fir <= 0;
		data_to_iir <= 0;
		data_from_iir <=0;
	end

	//FSM for FIR enable.
	if (fir_enable)
	begin
		case ({to_fir_empty, to_fir_full, from_fir_empty, from_fir_full})
		4'b0000: {data_to_fir, data_from_fir} <= 2'b01;
		4'b0001: {data_to_fir, data_from_fir} <= 2'b01;
		4'b0010: {data_to_fir, data_from_fir} <= 2'b10;
		4'b0100: {data_to_fir, data_from_fir} <= 2'b01;
		4'b0101: {data_to_fir, data_from_fir} <= 2'b01;
		4'b0110: {data_to_fir, data_from_fir} <= 2'b00;
		4'b1000: {data_to_fir, data_from_fir} <= 2'b10;
		4'b1001: {data_to_fir, data_from_fir} <= 2'b01;
		4'b1010: {data_to_fir, data_from_fir} <= 2'b10;
		endcase
		data_to_fft <= 0;
		data_from_fft <= 0;
		data_to_iir <= 0;
		data_from_iir <=0;
	end

	//FSM for IIR enable.
	if (iir_enable)
	begin
		case ({to_iir_empty, to_iir_full, from_iir_empty, from_iir_full})
		4'b0000: {data_to_iir, data_from_iir} <= 2'b01;
		4'b0001: {data_to_iir, data_from_iir} <= 2'b01;
		4'b0010: {data_to_iir, data_from_iir} <= 2'b10;
		4'b0100: {data_to_iir, data_from_iir} <= 2'b01;
		4'b0101: {data_to_iir, data_from_iir} <= 2'b01;
		4'b0110: {data_to_iir, data_from_iir} <= 2'b00;
		4'b1000: {data_to_iir, data_from_iir} <= 2'b10;
		4'b1001: {data_to_iir, data_from_iir} <= 2'b01;
		4'b1010: {data_to_iir, data_from_iir} <= 2'b10;
		endcase
		data_to_fft <= 0;
		data_from_fft <= 0;
		data_to_fir <= 0;
		data_from_fir <=0;
	end
end

	assign data_bus = (data_from_fft? fft_data_in : {32'bZ});
	assign fft_data_out = (data_to_fft ? data_bus : {32'bZ});

	assign data_bus = (data_from_fir ? fir_data_in : {32'bZ});
	assign fir_data_out = (data_to_fir ? data_bus : {32'bZ});

	assign data_bus = (data_from_iir ? iir_data_in : {32'bZ});
	assign iir_data_out = (data_to_iir ? data_bus : {32'bZ});

endmodule