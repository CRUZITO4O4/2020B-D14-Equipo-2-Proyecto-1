module buffer3(
	input clk,
	input regwrite_in,
	input memtoreg_in,
	input memwrite_in,
	input memread_in,
	input branch_in,
	input[31:0]branch_result_in,
	input zflag_in,
	input[31:0]alures_in,
	input[31:0]data2_in,
	input[4:0]instruccion_in,
	
	output reg regwrite_out,
	output reg memtoreg_out,
	output reg memwrite_out,
	output reg memread_out,
	output reg branch_out,
	output reg [31:0]branch_result_out,
	output reg zflag_out,
	output reg [31:0]alures_out,
	output reg [31:0]data2_out,
	output reg [4:0]instruccion_out
);
always @(posedge clk)
	begin
		regwrite_out <= regwrite_in;
		memtoreg_out <= memtoreg_in;
		memwrite_out <= memwrite_in;
		memread_out <= memread_in;
		branch_out <= branch_in;
		branch_result_out <= branch_result_in;
		zflag_out <= zflag_in;
		alures_out <= alures_in;
		data2_out <= data2_in;
		instruccion_out <= instruccion_in;
	end 
	
endmodule
