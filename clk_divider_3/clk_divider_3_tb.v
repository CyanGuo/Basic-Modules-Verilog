
module clk_divider_3_tb;

reg clk, rst_n;
wire clk_div_3;

clk_divider_3 dut (.clk(clk), .rst_n(rst_n), .clk_div_3(clk_div_3));

initial begin
	clk = 0;
	rst_n = 0;
	#5 rst_n =1;
	
end

always #2 clk = ~clk;

endmodule 