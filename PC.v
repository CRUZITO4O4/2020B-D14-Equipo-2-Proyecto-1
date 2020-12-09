module PC(
	input[31:0]inputpc,
	input clk,
	output reg[31:0]outputpc
);

initial
begin
	outputpc <= 32'd0;
end

always@(posedge clk)
begin
   outputpc = inputpc;
end

endmodule
