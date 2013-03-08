/******************************************************************************
**
** Module:      data_bus_controller_tb
** Description: Testbench for data bus controller in data & control router.
**
** Author:      Miles Sherman
** Affiliation: Columbia University
**
** Last Update: 03/07/2013
**
******************************************************************************/

`define half_clk_period #25000
`define SD #1000

module data_bus_controller_tb();

reg [31:0] fft_data_in, fir_data_in, iir_data_in;
reg fft_put_req, fir_put_req, iir_put_req, fft_put_req, fir_put_req, iir_put_req, fft_full, fir_full, iir_full, fft_empty, fir_empty, iir_empty, clk;
wire [31:0] data_bus, fft_data_out, fir_data_out, iir_data_out;
integer i, j, k;

data_bus_controller databus_cntl (.data_bus(data_bus), .fft_data_in(fft_data_in), .fir_data_in(fir_data_in), .iir_data_in(iir_data_in), .fft_data_out(fft_data_out), .fir_data_out(fir_data_out), .iir_data_out(iir_data_out), .fft_put_req(fft_put_req), .fir_put_req(fir_put_req), .iir_put_req(iir_put_req), .fft_get_req(fft_get_req), .fir_get_req(fir_get_req), .iir_get_req(iir_get_req), .fft_full(fft_full), .fir_full(fir_full), .iir_full(iir_full), .fft_empty(fft_empty), .fir_empty(fir_empty), .iir_empty(iir_empty), .clk(clk));



   always begin
      `half_clk_period;
      clk = ~clk;
   end

   initial begin
		//Initialize inputs.
		clk = 0;
		fft_data_in = 0;
		fir_data_in = 0;
		iir_data_in = 0;
		fft_put_req = 0;
		fir_put_req = 0;
		iir_put_req = 0;
		fft_get_req = 0;
		fir_get_req = 0;
		iir_get_req = 0;
		fft_full = 0;
		fir_full = 0;
		iir_full = 0;
		fft_empty = 1;
		fir_empty = 1;
		iir_empty = 1;
		
		fft_data_in = 

		offset = 0;
		filesize = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		offset = 0;
		filesize = 10000;
		enable = 1;
		
		for (i = 0; i <2500; i=i+1) 
      		begin
			@(posedge clk);
      		end
		enable = 0;

		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		enable = 1;
		offset = 100524;
		filesize = 1000;
		
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$finish;
   end 

endmodule
