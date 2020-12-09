`timescale 1ns/1ns
 
module TB_TIPO_I();
reg clk_tb=0;

TIPO_I instancia_DataPathTipoI(
	.clk(clk_tb)
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
