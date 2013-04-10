/******************************************************************************
**
** Module:      pla_top
** Description: Logic array for high level control of communication interface
**              system and accelerators.
**
** Author:      Miles Sherman
** Contact:     ms4543@columbia.edu
** Affiliation: Columbia University
**
** Last Update: 03/18/2013
**
******************************************************************************/


module pla_top (instruction, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done, fft_enable, fir_enable, iir_enable, acc_done, clk, reset);

input clk, reset, fft_read_done, fft_write_done, fir_read_done, fir_write_done, iir_read_done, iir_write_done;

input [31:0] instruction;

output fft_enable, fir_enable, iir_enable, acc_done;

reg fft_enable, fir_enable, iir_enable, acc_done;
reg instruction_valid;

always @(posedge instruction[31:0])
begin
	instruction_valid = 1;
end

always @(negedge instruction[31:0])
begin
	instruction_valid = 1;
end

always @(*)
begin
	if (fft_read_done & fft_write_done)
	begin
		instruction_valid = 0;
		acc_done = 1;
	end
	if (fir_read_done & fir_write_done)
	begin
		instruction_valid = 0;
		acc_done = 1;
	end
	if (iir_read_done & iir_write_done)
	begin
		instruction_valid = 0;
		acc_done = 1;
	end
end
	
always @(*)
begin
if (!reset)
begin
	//FSM for FFT signals.
	if (instruction == 2'b01 & instruction_valid == 1)
	begin
		if (!fft_read_done & !fft_write_done)
		begin
			fft_enable = 1;
			acc_done <= 0;
		end
		else if (fft_read_done & !fft_write_done)
		begin
			fft_enable = 1;
			acc_done <= 0;
		end
		else if (fft_read_done & fft_write_done)
		begin
			fft_enable = 0;
			acc_done <= 1;
		end
		{fir_enable, iir_enable} <= 2'b00;
	end

	//FSM for FIR signals.
	else if (instruction == 2'b10 & instruction_valid == 1)
	begin
		if (!fir_read_done & !fir_write_done)
		begin
			fir_enable = 1;
			acc_done <= 0;
		end
		else if (fir_read_done & !fir_write_done)
		begin
			fir_enable = 1;
			acc_done <= 0;
		end
		else if (fir_read_done & fir_write_done)
		begin
			fir_enable = 0;
			acc_done <= 1;
		end
		{fft_enable, iir_enable} <= 2'b00;
	end

	//FSM for IIR signals.
	else if (instruction == 2'b11 & instruction_valid == 1)
	begin
		if (!iir_read_done & !iir_write_done)
		begin
			iir_enable = 1;
			acc_done <= 0;
		end
		else if (iir_read_done & !iir_write_done)
		begin
			iir_enable = 1;
			acc_done <= 0;
		end
		else if (iir_read_done & iir_write_done)
		begin
			iir_enable = 0;
			acc_done <= 1;
		end
		{fft_enable, fir_enable} <= 2'b00;
	end
	else
	begin
			{fft_enable, fir_enable, iir_enable} <= 3'b000;
	end
end
else
begin
	{fft_enable, fir_enable} <= 2'b00;
	acc_done <= 0;
end
end
endmodule
