module mux(
	input[31:0]input1,input2,
	input signal,
	output reg[31:0]outputmux
);

always@*
begin
	if (signal == 0)
		outputmux = input1;
	else
		outputmux = input2;
end

endmodule
