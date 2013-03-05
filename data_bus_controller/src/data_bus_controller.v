module data_bus_controller (data_bus, fft_data_in, fir_data_in, iir_data_in, fft_data_out, fir_data_out, iir_data_out, fft_put_req, fir_put_req, iir_put_req, fft_get_req, fir_get_req, iir_get_req, fft_full, fir_full, iir_full, fft_empty, fir_empty, iir_empty, clk);

inout [31:0] data_bus;

input [31:0] fft_data_in, fir_data_in, iir_data_in;
input fft_put_req, fir_put_req, iir_put_req, fft_put_req, fir_put_req, iir_put_req, fft_full, fir_full, iir_full, fft_empty, fir_empty, iir_empty, clk;

output [31:0] fft_data_out, fir_data_out, iir_data_out;
	
always @(posedge clk)
begin
	if (!fft_empty && fft_get_req == 1)
	begin
		data_bus <= fft_data_in;
	end
	if (!fir_empty && fir_get_req == 1)
	begin
		data_bus <= fir_data_in;
	end
	if (!iir_empty && iir_get_req == 1)
	begin
		data_bus <= iir_data_in;
	end
	if (!fft_full && fft_put_req == 1)
	begin
		fft_data_in <= data_bus;
	end
	if (!fir_full && fir_put_req == 1)
	begin
		fir_data_in <= data_bus;
	end
	if (!iir_full && iir_put_req == 1)
	begin
		iir_data_in <= data_bus;
	end
end
endmodule
