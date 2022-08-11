
module clk_divider_2 (
		input clk, rst_n,
		output clk_div_2);

reg clk_div_2;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) clk_div_2 <= 0;
	else clk_div_2 <= ~clk_div_2;
end


endmodule 