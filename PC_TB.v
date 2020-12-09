`timescale 1ns/1ns

module PC_TB();
  
reg [4:0]inputpc_tb;
wire [4:0]outputpc_tb;

PC modulo1(
.inputpc(inputpc_tb),
.outputpc(outputpc_tb)
);

initial
begin
  inputpc_tb=4'b0101;
  #10;
  
  inputpc_tb=4'b0110;
  #10;
  $stop;
end

endmodule 
