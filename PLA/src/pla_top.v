/******************************************************************************
**
** Module:      pla_top
** Description: Logic array for high level control of communication interface
**		system and accelerators.
**
** Author:      Miles Sherman
** Contact:	ms4543@columbia.edu
** Affiliation: Columbia University
**
** Last Update: 03/18/2013
**
******************************************************************************/


module pla_top (instruction, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done, ram_read_enable, ram_write_enable, fft_done, fft_enable, fft_put_req, fft_get_req, fir_enable, fir_put_req, fir_get_req, iir_enable, iir_put_req, iir_get_req, acc_done, clk, reset);

input clk, reset, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done;

input [31:0] instruction, offset, filesize;

output ram_read_enable, ram_write_enable, fft_enable, fft_put_req, fft_get_req, fir_enable, fir_put_req, fir_get_req, iir_enable, iir_put_req, iir_get_req;
	
always @(posedge clk)
begin
if (!reset)
begin
	//FSM for FFT signals.
	if (instruction == 2'b01)
	begin
		if (!fft_read_done & !fft_write_done)
		begin
			fft_enable = 1;
			{fft_put_req, fft_get_req} <= 2'b11;
			acc_done <= 0;
		end
		else if (fft_read_done & !fft_write_done)
		begin
			fft_enable = 1;
			{fft_put_req, fft_get_req} <= 2'b01;
			acc_done <= 0;
		end
		else if (fft_read_done & fft_write_done)
		begin
			fft_enable = 0;
			{fft_put_req, fft_get_req} <= 2'b00;
			acc_done <= 1;
		end
		{fir_enable, iir_enable} <= 2'b00;
	end

	//FSM for FIR signals.
	else if (instruction == 2'b10)
	begin
		if (!fir_read_done & !fir_write_done)
		begin
			fir_enable = 1;
			{fir_put_req, fir_get_req} <= 2'b11;
			acc_done <= 0;
		end
		else if (fir_read_done & !fir_write_done)
		begin
			fir_enable = 1;
			{fir_put_req, fir_get_req} <= 2'b01;
			acc_done <= 0;
		end
		else if (fir_read_done & fir_write_done)
		begin
			fir_enable = 0;
			{fir_put_req, fir_get_req} <= 2'b00;
			acc_done <= 1;
		end
		{fft_enable, iir_enable} <= 2'b00;
	end

	//FSM for IIR signals.
	else if (instruction == 2'b11)
	begin
		if (!iir_read_done & !iir_write_done)
		begin
			iir_enable = 1;
			{iir_put_req, iir_get_req} <= 2'b11;
			acc_done <= 0;
		end
		else if (iir_read_done & !iir_write_done)
		begin
			iir_enable = 1;
			{iir_put_req, iir_get_req} <= 2'b01;
			acc_done <= 0;
		end
		else if (iir_read_done & iir_write_done)
		begin
			iir_enable = 0;
			{iir_put_req, iir_get_req} <= 2'b00;
			acc_done <= 1;
		end
		{fft_enable, fir_enable} <= 2'b00;
	end
	else
	begin
			acc_done <= 0;
	end
end
else
begin
	{fft_enable, fir_enable} <= 2'b00;
	acc_done <= 0;
end
end
endmodule