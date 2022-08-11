
module fibonacci (clk, rst_n, en, sum);

input wire clk, rst_n, en;
output wire [31:0] sum;

reg current_num;
reg next_sum;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) current_num = 0;
	else if (en) current_num <= next_sum;
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) next_sum <= 1;
	else if (en) next_sum <= sum;
end

assign sum = next_sum + current_num;


endmodule 