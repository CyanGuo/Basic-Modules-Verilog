
module clk_divider_N_tb;

reg clk, rst_n;

wire clk_div_2;
wire clk_div_3;
wire clk_div_4;
wire clk_div_5;
wire clk_div_8;

reg [7:0] N2;
reg [7:0] N3;
reg [7:0] N4;
reg [7:0] N5;
reg [7:0] N8;

clk_divider_N dut2 (.clk(clk), .rst_n(rst_n), .N(N2), .clk_div_N(clk_div_2));
clk_divider_N dut3 (.clk(clk), .rst_n(rst_n), .N(N3), .clk_div_N(clk_div_3));
clk_divider_N dut4 (.clk(clk), .rst_n(rst_n), .N(N4), .clk_div_N(clk_div_4));
clk_divider_N dut5 (.clk(clk), .rst_n(rst_n), .N(N5), .clk_div_N(clk_div_5));
clk_divider_N dut8 (.clk(clk), .rst_n(rst_n), .N(N8), .clk_div_N(clk_div_8));

initial begin
	
	clk = 0;
	rst_n = 0;
	N2 = 8'd2;
	N3 = 8'd3;
	N4 = 8'd4;
	N5 = 8'd5;
	N8 = 8'd8;	
	#5 rst_n =1;
	
end

always #2 clk = ~clk;

endmodule 