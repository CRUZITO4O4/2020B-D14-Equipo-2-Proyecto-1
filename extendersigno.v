module extendersigno(
	input[15:0]inputsigno,
	output reg[31:0]outputsigno
);

	always@*
	begin
		if (inputsigno[15]==0)
			begin
            outputsigno = {16'b0000000000000000,inputsigno[15:0]};
			end
		else
			begin
            outputsigno = {16'b1111111111111111,inputsigno[15:0]};
			end
	end
endmodule
