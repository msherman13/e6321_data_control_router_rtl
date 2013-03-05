module data_bus_controller (fft_enable, fir_enable, iir_enable, clk, addr, fft_done, filt_done);
	input [31:0] offset, filesize;
	input fir_enable, iir_enable, fft_enable, clk;
	output [31:0] addr;
	output fft_done, filt_done;
	
	wire [31:0] count;
	wire [31:0] fft_addr, filt_addr;
	wire filt_enable;

fft_address_calc fft_calc (.offset(offset), .filesize(filesize), .enable(fft_enable), .clk(clk), .addr(fft_addr), .done(fft_done));
	
filt_address_calc filt_calc (.offset(offset), .filesize(filesize), .enable(filt_enable), .clk(clk), .addr(filt_addr), .done(filt_done));

always @(posedge clk)
begin

	if (fir_enable == 1 || iir_enable == 1)
	begin
		filt_enable <= 1;
	end
	
	if (fft_enable == 1)
	begin
		addr <= fft_addr;
	end

	if (filt_enable <= 1)
	begin
		addr <= filt_addr;
	end
end
endmodule
