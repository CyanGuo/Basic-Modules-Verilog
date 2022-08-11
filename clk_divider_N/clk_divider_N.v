
module clk_divider_N (
		input clk, rst_n, 
		input [7:0] N,
		output clk_div_N);

wire [7:0] N_minus1;
reg [7:0] pos_cnt;
reg pos;
reg neg;

assign N_minus1 = N - 1;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) pos_cnt <= 0;
	else if (pos_cnt == N-1) pos_cnt <= 0;
	else pos_cnt <= pos_cnt + 1;
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) pos <= 0;
	else if (pos_cnt == N_minus1[7:1]) 	pos <= 1;
	else if (pos_cnt == N_minus1) 		pos <= 0;
end


always @ (negedge clk or negedge rst_n)
begin
	if (!rst_n) neg <= 0;
	else if (N[0] == 1) neg <= pos; // or use N_minus1[0] = 0; which means odd number(N)
end

assign clk_div_N = pos | neg;

endmodule 

//------------ if use N but not N-1, following code is acceptable
/*
	else if (N[0] == 0) begin
		if (pos_cnt == N[7:1]-1) pos <= 1;
		else if (pos_cnt == N-1) pos <= 0;
	end
	else if (N[0] == 1) begin
		if (pos_cnt == N[7:1]) pos <= 1;
		else if (pos_cnt == N-1) pos <= 0;
	end
*/