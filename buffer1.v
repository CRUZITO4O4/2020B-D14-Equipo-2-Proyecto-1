module buffer1(
input [31:0]intruccion_in,
input [31:0]pcsumain,
input clk,
output reg [31:0]intruccion_out,
output reg [31:0]pcsumaout

);

always @(posedge clk)
	begin
	intruccion_out = intruccion_in;
	pcsumaout =  pcsumain;
	end 

endmodule 
