module meminstruc(
	input[31:0]inputmeminstruc,
	output reg[31:0]outputmeminstruc
);
reg[7:0]memoria[0:256];


always@*
begin
	outputmeminstruc = {memoria[inputmeminstruc],memoria[inputmeminstruc + 1],memoria[inputmeminstruc + 2],memoria[inputmeminstruc + 3]};
end


//C:\Users\aaron\Desktop\TestF1_MemInst.txt
//C:\\Users\\aaron\\Desktop\\TestF2_MemInst .txt

initial
begin
	$readmemb("C:\\Users\\aaron\\Desktop\\TestF2_MemInst .txt",memoria);
end

endmodule
