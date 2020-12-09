module memdatos(
	input [31:0]adress, writedata,
	input ewr,memread,
	output reg [31:0]read_data
);
//wire, reg

reg[31:0]BReg[0:127];


always@*
begin
  case (ewr==1)
    1'b1:
      begin
        BReg[adress] <= writedata;     
      end
  endcase
  case (memread==1)
    1'b1:
        begin
          read_data <= BReg[adress];
        end
  endcase
  end 

endmodule

