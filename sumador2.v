module sumador2(
	input[31:0]inputsumador1,inputsumador2,
	output reg [31:0]outputsumador
);

always@*
begin
	outputsumador = inputsumador1 + inputsumador2;
end

//assign outputsumador = inputsumador1 + inputsumador2;

endmodule
