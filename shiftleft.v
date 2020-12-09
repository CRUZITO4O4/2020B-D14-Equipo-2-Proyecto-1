module shiftleft(
	input[31:0] inputshiftleft,
	output reg[31:0] outputshiftleft
);

always @*
begin
	outputshiftleft = inputshiftleft << 2;
end

endmodule
