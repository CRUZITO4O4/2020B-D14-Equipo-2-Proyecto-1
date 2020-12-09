module buffer2(
	input clk,
	input regwrite_in,
	input memtoreg_in,
	input memwrite_in,
	input memread_in,
	input branch_in,
	input [2:0]aluop_in,
	input alusrc_in,
	input regdst_in,
	input [31:0]pcsumain_in,
	input [31:0]data1_in,
	input [31:0]data2_in,
	input [31:0]signextender_in,
	input [4:0]instruccion_in,
	input [4:0]instruccion2_in,
	
	output reg regwrite_out,
	output reg memtoreg_out,
	output reg memwrite_out,
	output reg memread_out,
	output reg branch_out,
	output reg[2:0]aluop_out,
	output reg alusrc_out,
	output reg regdst_out,
	output reg[31:0]pcsumain_out,
	output reg[31:0]data1_out,
	output reg[31:0]data2_out,
	output reg[31:0]signextender_out,
	output reg[4:0]instruccion_out,
	output reg[4:0]instruccion2_out
);

always @(posedge clk)
	begin
	regwrite_out <= regwrite_in;
	memtoreg_out <= memtoreg_in;
	memwrite_out <= memwrite_in;
	memread_out <= memread_in;
	branch_out <= branch_in;
	aluop_out <= aluop_in;
	alusrc_out <= alusrc_in;
	regdst_out <= regdst_in;
	pcsumain_out <= pcsumain_in;
	data1_out <= data1_in;
	data2_out <= data2_in;
	signextender_out <= signextender_in;
	instruccion_out <= instruccion_in;
	instruccion2_out <= instruccion2_out;
	end 

endmodule 