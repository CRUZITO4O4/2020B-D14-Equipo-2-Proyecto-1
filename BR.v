module BR(
	input[4:0]lectura1,lectura2,escritura,
	input[31:0]dato_a_escribir,
	input regwrite,
	output reg[31:0]dato1,dato2
);
reg[31:0]BR[0:31];

always@*
begin
	if (dato_a_escribir == 1)				//Si RegEn es igual a 1 escribira en el banco de registros
		BR[escritura]<=dato_a_escribir;
	
	dato1 <= BR[lectura1];
	dato2 <= BR[lectura2];
end

//C:\Users\aaron\Downloads\TestF1_BReg.mem

initial
begin
	$readmemb("C:\\Users\\aaron\\Desktop\\TestF1_BReg.txt",BR);
end

endmodule

