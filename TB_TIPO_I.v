`timescale 1ns/1ns
 
module TB_TIPO_I();
reg clk_tb = 0;
wire[31:0]cheking;
wire[31:0]meminstruc_check;

TIPO_I instancia_DataPathTipoI(
	.clk_datapath(clk_tb),
	.check(cheking),
	.c1(meminstruc_check)
);

initial
begin
	clk_tb = 1'b0;
	forever #50 clk_tb = ~clk_tb;
end

initial
begin
	#10000
	$stop;
end

endmodule
