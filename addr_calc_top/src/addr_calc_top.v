module addr_calc_top (offset, filesize, fft_enable, fir_enable, iir_enable, fft_read_pause, fir_read_pause, iir_read_pause, fft_write_pause, fir_write_pause, iir_write_pause, clk, addr, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done);
	input [31:0] offset, filesize;
	input fir_enable, iir_enable, fft_enable, fft_read_pause, fir_read_pause, iir_read_pause, fft_write_pause, fir_write_pause, iir_write_pause, clk;
	output [31:0] addr;
	output fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done;
	
	wire [31:0] fft_read_addr, fft_write_addr, fir_read_addr, fir_write_addr, iir_read_addr, iir_write_addr;

fft_address_calc fft_read_calc (.offset(offset), .filesize(filesize), .enable(fft_enable), .pause(fft_read_pause), .clk(clk), .addr(fft_read_addr), .done(fft_read_done));
fft_address_calc fft_write_calc (.offset(offset), .filesize(filesize), .enable(fft_enable), .pause(fft_write_pause), .clk(clk), .addr(fft_write_addr), .done(fft_write_done));
	
filt_address_calc fir_read_calc (.offset(offset), .filesize(filesize), .enable(fir_enable), .pause(fir_read_pause), .clk(clk), .addr(fir_read_addr), .done(fir_read_done));
filt_address_calc fir_write_calc (.offset(offset), .filesize(filesize), .enable(fir_enable), .pause(fir_write_pause), .clk(clk), .addr(fir_write_addr), .done(fir_write_done));

filt_address_calc iir_read_calc (.offset(offset), .filesize(filesize), .enable(iir_enable), .pause(iir_read_pause), .clk(clk), .addr(iir_read_addr), .done(iir_read_done));
filt_address_calc iir_write_calc (.offset(offset), .filesize(filesize), .enable(iir_enable), .pause(iir_write_pause), .clk(clk), .addr(iir_write_addr), .done(iir_write_done));

always @(posedge clk)
begin

	assign addr = ((fft_enable && !done && !fft_read_pause) ? fft_read_addr : {32'bZ});
	assign addr = ((fft_enable && !done && !fft_write_pause) ? fft_read_addr : {32'bZ});

	assign addr = ((fir_enable && !done && !fir_read_pause) ? fir_read_addr : {32'bZ});
	assign addr = ((fir_enable && !done && !fir_write_pause) ? fir_read_addr : {32'bZ});

	assign addr = ((iir_enable && !done && !iir_read_pause) ? iir_read_addr : {32'bZ});
	assign addr = ((iir_enable && !done && !iir_write_pause) ? iir_read_addr : {32'bZ});
	
/*	if (fft_enable == 1 && !done)
	begin
		if (!fft_read_pause)
		begin
			addr <= fft_read_addr;
		end
		if (!fft_write_pause)
		begin
			addr <= fft_write_addr;
		end
	end

	if (fir_enable == 1 && !done)
	begin
		if (!fir_read_pause)
		begin
			addr <= fir_read_addr;
		end
		if (!fir_write_pause)
		begin
			addr <= fir_write_addr;
		end
	end

	if (iir_enable == 1 && !done)
	begin
		if (!iir_read_pause)
		begin
			addr <= iir_read_addr;
		end
		if (!iir_write_pause)
		begin
			addr <= iir_write_addr;
		end
	end
*/

end
endmodule
