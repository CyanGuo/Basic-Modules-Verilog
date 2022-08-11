
module clk_divider_3 (
		input clk, rst_n,
		output clk_div_3);

reg [1:0] pos_cnt;
reg pos;
reg neg;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) pos_cnt <= 0;
	else if (pos_cnt == 2'b10) pos_cnt <= 0;
	else pos_cnt <= pos_cnt + 1;
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) pos <= 0;
	else if (pos_cnt == 1) pos <= 1;
	else if (pos_cnt == 2) pos <= 0;
end

always @ (negedge clk or negedge rst_n)
begin
	if (!rst_n) neg <= 0;
	else neg <= pos;
end

assign clk_div_3 = pos | neg;

endmodule 