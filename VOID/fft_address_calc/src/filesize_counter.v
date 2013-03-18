module counter1_4 (filesize,enable,pause,clk,count,done);
	input [31:0] filesize;
	input enable, clk, pause;
	output [31:0] count;
	output done;

reg[31:0] count;
reg done;

always @(posedge clk)
begin
	if (enable)
	begin
		if (count != filesize/4)
		begin
			if (!pause)
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
				count <= count;
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
