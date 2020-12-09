module sumador(
	input[31:0]inputsumador1,
	output reg[31:0]outputsumador
);
always @(inputsumador1)
begin
	outputsumador = inputsumador1+4;
end

/*
assign inputsumador2 = 4;
assign outputsumador = inputsumador1 + inputsumador2;
*/

endmodule
