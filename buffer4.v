module buffer4(
	input clk,
	input regwrite_in,
	input memtoreg_in,
	input [31:0]memres_in,
	input [31:0]alures_in,
	input [4:0]writeregister_in,
	
	output reg regwrite_out,
	output reg memtoreg_out,
	output reg [31:0]memres_out,
	output reg [31:0]alures_out,
	output reg [4:0]writeregister_out
);

always @(posedge clk)
	begin
		regwrite_out <= regwrite_in;
		memtoreg_out <= memtoreg_in;
		memres_out <= memres_in;
		alures_out <= alures_in;
		writeregister_out <= writeregister_in;
	end 
	
endmodule