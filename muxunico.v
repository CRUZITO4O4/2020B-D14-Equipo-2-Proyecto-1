module muxunico(
	input[4:0]input1,input2,
	input regdst,
	output reg[4:0]outputmux
);

always@*
begin
	if (regdst == 0)
		outputmux = input1;
	else
		outputmux = input2;
end

endmodule
