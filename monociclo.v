import	lagarto0_pkg::*;

module monociclo (
	input						clk_i,
	input						rst_ni,
	output		[31:0]	monitor_o
);
	//Asignación de la señal monitor
	assign					monitor_o	=	rf_dators1_w;
	
	//Sección de declaración de señales
	//IF - Instruction Fetch
	wire			[ICACHE_LINE_SIZE-1:0]	if_instblock_w;
	wire			[31:0]						if_inst_w;
	wire											hit_w;
	wire			[6:0]							opcode_w;
	wire			[ADDR_SIZE-1:0]			pc_next_w;
	//IQueue - Instruction Queue
	wire						iq_full_w;
	wire						iq_empty_w;
	//RF - Register File write
	wire						rf_write_w;
	wire			[4:0]		rf_rd_w ;
	wire			[4:0]		rf_rs1_w;
	wire			[4:0]		rf_rs2_w;
	wire			[31:0]	rf_dators1_w;
	wire			[31:0]	rf_dators2_w;
	
	//Asignación de señales
	assign					opcode_w =	if_inst_w[6:0];
	assign					rf_rd_w 	=	if_inst_w[11:7];
	assign					rf_rs1_w	=	if_inst_w[19:15];
	assign					rf_rs2_w	=	if_inst_w[24:20];
	//Etapa de Fetch
	Fetch Fetch_Stage(
		.clk_i				(clk_i),
		.rst_ni				(rst_ni),
//		.iq_full_i			(iq_full_w),
		.if_instblock_i	(if_instblock_w),
		.hit_i				(hit_w),
		.pc_next_o			(pc_next_w)
	);
	
	//ICACHE
	icache	icachel1(
		.clk_i			(clk_i),
		.rst_ni			(rst_ni),
		.pc_i				(pc_next_w),
		.we_i				(1'b0),
		.inst_i			({ISA_SIZE{1'b0}}),
		.re_i				(1'b1),
		.inst_o			(if_instblock_w),
		.hit				(hit_o)
	);
	
//	//Cola de instrucciones
//	iqueue IQ_Fetch(
//		.clk_i		(clk_i),
//		.rst_ni		(rst_ni),
//		.wr_i			(hit_w),
//		.data_i		(if_instblock_w),
//		.rd_i			(1'b1),
//		.data_o		(if_inst_w),
//		.full_o		(iq_full_w),
//		.empty_o		(iq_empty_w)
//	);
	
	//Etapa de Decodificación
	decoder Deco_Stage(
		.opcode_i	(opcode_w),
		.rfwrite_o	(rf_write_w)
	);
	
	//Etapa de lectura al Banco de Registros
	regfile RegRead_Stage(
		.clk_i		(clk_i),
		.rd_i			(rf_rd_w),
		.datord_i	(32'b0),
		.wren_i		(rf_write_w),
		.rs1_i		(rf_rs1_w),
		.dators1_o	(rf_dators1_w),
		.rs2_i		(rf_rs2_w),
		.dators2_o	(rf_dators2_w)
	);
endmodule 