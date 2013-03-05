module counter1 (filesize,enable,clk,count,done);
	input [31:0] filesize;
	input enable, clk;
	output [31:0] count;
	output done;

reg[31:0] count;
reg done;

always @(posedge clk)
begin
	if (enable)
	begin
		if (count != filesize)
		begin
			if (count == 100000000)
			begin
				count <= 0;
				done <= 0;
			end else
			begin
				done <= 0;
				count <= count + 1;
			end
		end else
		begin
			count <= 100000000;
			done <= 1;
		end
	end else
	begin
		count <= 100000000;
		done <= 1;
	end
end
endmodule
