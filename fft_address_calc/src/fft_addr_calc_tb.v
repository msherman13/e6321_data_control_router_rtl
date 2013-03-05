`define half_clk_period #25000
`define SD #1000

module fft_addr_calc_tb();


   reg [31:0] offset, filesize;
   reg enable, clk;
   wire done;
   wire [31:0] addr;
   integer i;

fft_address_calc calculator (.offset(offset), .filesize(filesize), .enable(enable), .clk(clk), .addr(addr), .done(done));

   always begin
      `half_clk_period;
      clk = ~clk;
   end

   initial begin
		clk = 0;
		enable = 0;
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
