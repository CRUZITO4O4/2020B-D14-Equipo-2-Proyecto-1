module sumador(
	input[31:0]inputsumador1,inputsumador2,
	output[31:0]outputsumador
);

assign inputsumador2 = 4;
assign outputsumador = inputsumador1 + inputsumador2;

endmodule
