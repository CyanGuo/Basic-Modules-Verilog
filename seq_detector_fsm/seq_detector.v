
module seq_detector (
		input clk, rst_n, datain
		output out);

reg dataout;
reg [3:0] state;
reg [3:0] state_next;

localparam S_IDLE 	= 4'b0000;
localparam S_1		= 4'b0001;
localparam S_10		= 4'b0010;
localparam S_100	= 4'b0100;
localparam S_1001	= 4'b1000;


always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) state <= S_IDLE;
	else state <= state_next;
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n) out <= 0;
	else if (state == S_1001 && in == 1) out <= 1;
end

always @ (*)
begin
	if (!rst_n) state_next = S_IDLE;
	else begin
		case (state):
		S_IDLE:
			if (in == 1) state_next = S_1;
			else state_next = S_IDLE;
		S_1:
			if (in == 0) state_next = S_10;
			else state_next = S_1;
		S_10:
			if (in == 0) state_next = S_100;
			else state_next = S_1;
		S_100:
			if (in == 1) state_next = S_1001;
			else state_next = S_IDLE;
		S_1001:
			if (in == 1) state = S_1;
			else state_next = S_10;
	end
end

endmodule 