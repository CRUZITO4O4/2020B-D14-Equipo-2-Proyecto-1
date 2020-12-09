module control (
	input[5:0]inputcontrol,
	output reg regdst,branch,memread,memtoreg,memwrite,ALUSrc,regwrite,
	output reg[2:0]ALUOp
);

always@*
	begin
	case(inputcontrol)
		6'b000000://tipor
			begin
			memread = 1'b0;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b010; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b1;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b000100://BEQ
			begin
			memread = 1'b0;
			regwrite = 1'b0; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b001; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b1;
			ALUSrc = 1'b0;
			end
		6'b100011://lw
			begin
			memread = 1'b1;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b1; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b000; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b101011://sw
			begin
			memread = 1'b0;
			regwrite = 1'b0; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b1; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b000; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b001000://addi
			begin
			memread = 1'b0;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b001; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b001100://ANDi
			begin
			memread = 1'b0;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b101; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b001101://ORi
			begin
			memread = 1'b0;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b111; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
		6'b001010://SLTi
			begin
			memread = 1'b0;
			regwrite = 1'b1; //Indica a la memoria si va a escribir o leer
			memtoreg = 1'b0; //Indica el Mux si toma el valor del BR o del resultado de la ALU
			memwrite = 1'b0; //Indica a la memoria si va leer o escribir 
			ALUOp = 3'b100; //Indica a la ALUCONTROL si hara caso al FUNC o no
			regdst = 1'b0;
			branch = 1'b0;
			ALUSrc = 1'b1;
			end
	endcase
	end
	
endmodule
