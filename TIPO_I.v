module TIPO_I(
	input clk_datapath
	/*
	output [31:0]check,
	output[31:0]c1
	*/
);

//Cables para interconexion completa:

//Cables de PC
wire [31:0]outpc_cable;

//Cables de Memoria de instrucciones
wire [31:0]outputmeminstruc_cable;

//Cables sumador 1
wire[31:0]outputsumador1_cable;

//Cables de buffer 1
wire[31:0]instruccion_out_cable;
wire[31:0]pcsumaout_cable;

//Cables del Banco De Registros
wire[31:0]dato1_cable;
wire[31:0]dato2_cable;

//Cables de Unidad de control
wire regdst_cable;
wire branch_cable;
wire memread_cable;
wire memtoreg_cable;
wire memwrite_cable;
wire ALUSrc_cable;
wire regwrite_cable;
wire[2:0]ALUOp_cable;

//Cables de sign extender
wire[31:0]outputsigno_cable;

//Cables de buffer 2
wire regdst_cable_buffer2;
wire branch_cable_buffer2;
wire memread_cable_buffer2;
wire memtoreg_cable_buffer2;
wire memwrite_cable_buffer2;
wire ALUSrc_cable_buffer2;
wire regwrite_cable_buffer2;
wire[2:0]ALUOp_cable_buffer2;
wire[31:0]outputsumador1_cable_buffer2;
wire[31:0]data1_out_cable;
wire[31:0]data2_out_cable;
wire[31:0]signextender_out_cable;
wire[4:0]instruccion_out_cable_buffer2;
wire[4:0]instruccion2_out_cable_buffer2;

//Cables shift left
wire[31:0]outputshiftleft_cable;

//cables de sumador 2
wire[31:0]branchresult;

//Cables de ALUSrc Mux
wire[31:0]outputmux_ALUSrc;

//Cables de ALUControl
wire[3:0]sel_cable;

//Cables de regdst MUX
wire[4:0]outputmux_regdst;

//Cables de ALUControl
wire ZF_cable;
wire[31:0]R_OP_cable;

//Cables de buffer3
wire regwrite_cable_buffer3;
wire memtoreg_cable_buffer3;
wire memwrite_cable_buffer3;
wire memread_cable_buffer3;
wire branch_cable_buffer3;
wire[31:0]branch_result_out_cable;
wire zflag_out_cable;
wire[31:0]alures_out_cable;
wire[31:0]data2_out_cable_buffer3;
wire[4:0]writeregister;

//Cables de compuerta AND
wire outputand_cable;

//Cables de memoria de datos
wire[31:0]memres_cable;

//Cables de buffer4
wire regwrite_buffer4;
wire memtoreg_buffer4;
wire[31:0]memres_buffer4;
wire[31:0]alures_buffer4;
wire[4:0]escritura_cable;

//Cable de MemToReg Mux
wire[31:0]dato_a_escribir_cable;
 
//Cable de PCSrc Mux
wire[31:0]outputmux_PCSrc;
 
PC instancia_PC(
	.clk(clk_datapath),
	.inputpc(outputmux_PCSrc),
	.outputpc(outpc_cable)
);

meminstruc instancia_memoria_instrucciones(
	.inputmeminstruc(outpc_cable),
	.outputmeminstruc(outputmeminstruc_cable)
);

sumador instancia_sumador1(
	.inputsumador1(outpc_cable),
	.outputsumador(outputsumador1_cable)
);

buffer1 instancia_buffer1(
	.clk(clk_datapath),
	.intruccion_in(outputmeminstruc_cable),
	.pcsumain(outputsumador1_cable),
	.intruccion_out(instruccion_out_cable),
	.pcsumaout(pcsumaout_cable)
);

BR instancia_banco_registros(
	.lectura1(instruccion_out_cable[25:21]),
	.lectura2(instruccion_out_cable[20:16]),
	.regwrite(regwrite_buffer4),
	.escritura(escritura_cable),
	.dato_a_escribir(dato_a_escribir_cable),
	.dato1(dato1_cable),
	.dato2(dato2_cable)
);

control instancia_unidad_control(
	.inputcontrol(instruccion_out_cable[31:26]),
	.regdst(regdst_cable),
	.branch(branch_cable),
	.memread(memread_cable),
	.memtoreg(memtoreg_cable),
	.memwrite(memwrite_cable),
	.ALUSrc(ALUSrc_cable),
	.regwrite(regwrite_cable),
	.ALUOp(ALUOp_cable)
);

extendersigno instancia_sign_extender(
	.inputsigno(instruccion_out_cable[15:0]),
	.outputsigno(outputsigno_cable)
);

buffer2 instancia_buffer2(
	.clk(clk_datapath),
	.regwrite_in(regwrite_cable),
	.memtoreg_in(memtoreg_cable),
	.memwrite_in(memwrite_cable),
	.memread_in(memread_cable),
	.branch_in(branch_cable),
	.aluop_in(ALUOp_cable),
	.alusrc_in(ALUSrc_cable),
	.regdst_in(regdst_cable),
	.pcsumain_in(pcsumaout_cable),
	.data1_in(dato1_cable),
	.data2_in(dato2_cable),
	.signextender_in(outputsigno_cable),
	.instruccion_in(instruccion_out_cable[20:16]),
	.instruccion2_in(instruccion_out_cable[15:11]),
	
	.regwrite_out(regwrite_cable_buffer2),
	.memtoreg_out(memtoreg_cable_buffer2),
	.memwrite_out(memwrite_cable_buffer2),
	.memread_out(memread_cable_buffer2),
	.branch_out(branch_cable_buffer2),
	.aluop_out(ALUOp_cable_buffer2),
	.alusrc_out(ALUSrc_cable_buffer2),
	.regdst_out(regdst_cable_buffer2),
	.pcsumain_out(outputsumador1_cable_buffer2),
	.data1_out(data1_out_cable),
	.data2_out(data2_out_cable),
	.signextender_out(signextender_out_cable),
	.instruccion_out(instruccion_out_cable_buffer2),
	.instruccion2_out(instruccion2_out_cable_buffer2)
);

shiftleft intancia_shiftleft(
	.inputshiftleft(data2_out_cable),
	.outputshiftleft(outputshiftleft_cable)
);

sumador2 instancia_sumador2(
	.inputsumador1(outputsumador1_cable_buffer2),
	.inputsumador2(outputshiftleft_cable),
	.outputsumador(branchresult)
);

mux instancia_alu_src_mux(
	.signal(ALUSrc_cable_buffer2),
	.input1(data2_out_cable),
	.input2(signextender_out_cable),
	.outputmux(outputmux_ALUSrc)
);

alucontrol instancia_alucontrol(
	.aluop(ALUOp_cable_buffer2),
	.func(signextender_out_cable[5:0]),
	.sel(sel_cable)
);

muxunico instancia_regdst_mux(
	.regdst(regdst_cable_buffer2),
	.input1(instruccion_out_cable_buffer2),
	.input2(instruccion2_out_cable_buffer2),
	.outputmux(outputmux_regdst)
);

ALU instancia_ALU(
	.op1(data1_out_cable),
	.op2(outputmux_ALUSrc),
	.sel(sel_cable),
	.R_OP(R_OP_cable),
	.ZF(ZF_cable)
);

buffer3 instancia_buffer3(
	.clk(clk_datapath),
	.regwrite_in(regwrite_cable_buffer2),
	.memtoreg_in(memtoreg_cable_buffer2),
	.memwrite_in(memwrite_cable_buffer2),
	.memread_in(memread_cable_buffer2),
	.branch_in(branch_cable_buffer2),
	.branch_result_in(branchresult),
	.zflag_in(ZF_cable),
	.alures_in(R_OP_cable),
	.data2_in(data2_out_cable),
	.instruccion_in(outputmux_regdst),
	
	.regwrite_out(regwrite_cable_buffer3),
	.memtoreg_out(memtoreg_cable_buffer3),
	.memwrite_out(memwrite_cable_buffer3),
	.memread_out(memread_cable_buffer3),
	.branch_out(branch_cable_buffer3),
	.branch_result_out(branch_result_out_cable),
	.zflag_out(zflag_out_cable),
	.alures_out(alures_out_cable),
	.data2_out(data2_out_cable_buffer3),
	.instruccion_out(writeregister)
);

Comp_AND intancia_branch_and(
	.inputand1(branch_cable_buffer3),
	.inputand2(zflag_out_cable),
	.outputand(outputand)
);

memdatos intancia_memoria_datos(
	.adress(alures_out_cable),
	.writedata(data2_out_cable_buffer3),
	.ewr(memwrite_cable_buffer3),
	.memread(memread_cable_buffer3),
	.read_data(memres_cable)
);

buffer4 instancia_buffer4(
	.clk(clk_datapath),
	.regwrite_in(regwrite_cable_buffer3),
	.memtoreg_in(memtoreg_cable_buffer3),
	.memres_in(memres_cable),
	.alures_in(alures_out_cable),
	.writeregister_in(writeregister),
	
	.regwrite_out(regwrite_buffer4),
	.memtoreg_out(memtoreg_buffer4),
	.memres_out(memres_buffer4),
	.alures_out(alures_buffer4),
	.writeregister_out(escritura_cable)
);

mux instancia_memtoreg_mux(
	.input1(memres_buffer4),
	.input2(alures_buffer4),
	.signal(memtoreg_buffer4),
	.outputmux(dato_a_escribir_cable)
);

mux instancia_PCSrc_mux(
	.input1(outputsumador1_cable),
	.input2(branch_result_out_cable),
	.signal(outputand),
	.outputmux(outputmux_PCSrc)
);
/*
assign check = dato1_cable;
assign c1 = dato2_cable;
*/
endmodule
