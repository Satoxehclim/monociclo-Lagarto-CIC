module Fetch (
	input							clk_i,
	input							rst_ni,
	output			[31:0]	if_inst_o,
	output						hit_o
);
	//Sección de declaración de señales
	wire				[31:0]	rst_addr_w;
	reg				[31:0]	pc_next_r;
	wire				[31:0]	pc_w;

	//Inicialización de señales
	assign			rst_addr_w = 32'b0;
	
	//Definición de un FFD
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				pc_next_r <= rst_addr_w;
			end
		else
			begin
				pc_next_r <= pc_w;
			end
	end
	
	assign	pc_w	= pc_next_r + 32'h4;
	
	icache	icachel1(
		.clk_i			(clk_i),
		.rst_ni			(rst_ni),
		.pc_i				(pc_next_r),
		.we_i				(1'b0),
		.inst_i			(32'h0),
		.re_i				(1'b1),
		.inst_o			(if_inst_o),
		.hit				(hit_o)
	);
	
endmodule 