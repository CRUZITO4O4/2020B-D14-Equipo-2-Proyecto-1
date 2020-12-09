module PC(
	input[31:0]inputpc,
	input clk,
	output reg[31:0]outputpc
);


always@(posedge clk)
begin
   outputpc = inputpc;
end

endmodule
