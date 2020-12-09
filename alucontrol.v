module alucontrol(
	input[2:0]aluop,
	input[5:0]func,
	output reg[3:0]sel
);
always@*
	begin
	case (aluop)
	3'b010:	//tipo R
		begin
		case(func)
			6'b100000:
				sel = 4'b0010;//Suma
			6'b100010:
				sel = 4'b0110;//resta
			6'b100100:
				sel = 4'b0000;//AND
			6'b100101:
				sel = 4'b0001; //OR
			6'b101010:
				sel = 4'b0111; //slt
		endcase
		end
	3'b000://LW y SW
		begin
		sel = 4'b0010;//suma
		end
	3'b001://beq
		begin
		sel = 4'b0110;//resta
		end
	3'b011://addi
		begin
		sel = 4'b0010;//suma
		end
	3'b111://ori
		begin
		sel = 4'b0001;//or
		end
	3'b101://andi
		begin
		sel = 4'b0000;//and
		end
	3'b100://slti
		begin
		sel = 4'b0111;//slt
		end	
	endcase
	end

endmodule
