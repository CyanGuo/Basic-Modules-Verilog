
module clock_gating (
		input clk, en,
		output gated_clk);

reg latch_out;

always @ (clk, en)
begin
	if(!clk) latch_out <= en;
end

assign gated_clk = latch_out & clk;


endmodule 