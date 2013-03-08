module data_bus_controller (data_bus, fft_data_in, fir_data_in, iir_data_in, fft_data_out, fir_data_out, iir_data_out, fft_put_req, fir_put_req, iir_put_req, fft_get_req, fir_get_req, iir_get_req, fft_full, fir_full, iir_full, fft_empty, fir_empty, iir_empty, clk);

inout [31:0] data_bus;

input [31:0] fft_data_in, fir_data_in, iir_data_in;
input fft_put_req, fir_put_req, iir_put_req, fft_put_req, fir_put_req, iir_put_req, fft_full, fir_full, iir_full, fft_empty, fir_empty, iir_empty, clk;

output [31:0] fft_data_out, fir_data_out, iir_data_out;

wire data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir, data_from_iir; 
	
always @(posedge clk)
begin

	if (fft_enable)
	begin
		case ({to_fft_empty, to_fft_full, from_fft_empty, from_fft_full})
		4'b0000: data_to_fft <= 0; data_from_fft <= 1;
		4'b0001: data_to_fft <= 0; data_from_fft <= 1;
		4'b0010: data_to_fft <= 1; data_from_fft <= 0;
		4'b0100: data_to_fft <= 0; data_from_fft <= 1;
		4'b0101: data_to_fft <= 0; data_from_fft <= 1;
		4'b0110: data_to_fft <= 0; data_from_fft <= 0;
		4'b1000: data_to_fft <= 1; data_from_fft <= 0;
		4'b1001: data_to_fft <= 0; data_from_fft <= 1;
		4'b1010: data_to_fft <= 1; data_from_fft <= 0;
		endcase
		data_to_fir <= 0;
		data_from_fir <= 0;
		data_to_iir <= 0;
		data_from_iir <=0;
	end

	if (fir_enable)
	begin
		case ({to_fir_empty, to_fir_full, from_fir_empty, from_fir_full})
		4'b0000: data_to_fir <= 0; data_from_fir <= 1;
		4'b0001: data_to_fir <= 0; data_from_fir <= 1;
		4'b0010: data_to_fir <= 1; data_from_fir <= 0;
		4'b0100: data_to_fir <= 0; data_from_fir <= 1;
		4'b0101: data_to_fir <= 0; data_from_fir <= 1;
		4'b0110: data_to_fir <= 0; data_from_fir <= 0;
		4'b1000: data_to_fir <= 1; data_from_fir <= 0;
		4'b1001: data_to_fir <= 0; data_from_fir <= 1;
		4'b1010: data_to_fir <= 1; data_from_fir <= 0;
		endcase
		data_to_fft <= 0;
		data_from_fft <= 0;
		data_to_iir <= 0;
		data_from_iir <=0;
	end


	if (fir_enable)
	begin
		case ({to_fir_empty, to_fir_full, from_fir_empty, from_fir_full})
		4'b0000: data_to_fir <= 0; data_from_fir <= 1;
		4'b0001: data_to_fir <= 0; data_from_fir <= 1;
		4'b0010: data_to_fir <= 1; data_from_fir <= 0;
		4'b0100: data_to_fir <= 0; data_from_fir <= 1;
		4'b0101: data_to_fir <= 0; data_from_fir <= 1;
		4'b0110: data_to_fir <= 0; data_from_fir <= 0;
		4'b1000: data_to_fir <= 1; data_from_fir <= 0;
		4'b1001: data_to_fir <= 0; data_from_fir <= 1;
		4'b1010: data_to_fir <= 1; data_from_fir <= 0;
		endcase
		data_to_fft <= 0;
		data_from_fft <= 0;
		data_to_fir <= 0;
		data_from_fir <=0;
	end
end
endmodule

/*
	assign data_bus = ((fft_enable && !fft_write_empty && !fft_read_empty) ? fft_data_in : {32'bZ});
	assign fft_data_out = ((!fft_full && fft_put_req) ? data_bus : {32'bZ});

	assign data_bus = ((!fir_empty && fir_get_req) ? fir_data_in : {32'bZ});
	assign fir_data_out = ((!fir_full && fir_put_req) ? data_bus : {32'bZ});

	assign data_bus = ((!iir_empty && iir_get_req) ? iir_data_in : {32'bZ});
	assign iir_data_out = ((!iir_full && iir_put_req) ? data_bus : {32'bZ});
*/

/*	if (!fft_empty && fft_get_req == 1)
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
*/

