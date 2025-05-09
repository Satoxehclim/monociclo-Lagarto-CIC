module decoder (
	input			[6:0]	opcode_i,
	output reg			rfwrite_o
);
	
	always @(*)
	begin
		case (opcode_i)
			//Soporte para instrucciones R
			7'b0110011:
				begin
					rfwrite_o	=	1'b1;
				end
			default:
				begin
					rfwrite_o	=	1'b0;
				end
		endcase
	end
endmodule 