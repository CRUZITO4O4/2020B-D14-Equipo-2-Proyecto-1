module buffer1(
input [31:0]intruccion_in,
input [31:0]pcsumain,
input clk,
output reg [31:0]intruccion_out,
output reg [31:0]pcsumaout
/*
output reg [4:0]rs_BF0, rt_BF0, rd_BF0,
output reg [5:0]op_BF0,
output reg [15:0]rdshfunct_BF0,
output reg [25:0]target_BF0
*/
);

always @(posedge clk)
	begin
	intruccion_out = intruccion_in;
	pcsumaout =  pcsumain;
	end 

endmodule 
