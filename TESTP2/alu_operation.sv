`ifndef ALU_OPERATION_SV
    `define ALU_OPERATION_SV

module alu_op
import pkg_system_mdr::*;(
	input				clk,
	input 				rst,

	if_mdr.alu_operation itf_alu_op
	);

/* 	input [1:0] w_product_2lsb,
	input 		w_enable,
	op_t		w_op,

	output 		w_alu_op */

	always_ff@(posedge clk, negedge rst) begin
		if(!rst)			
			itf_alu_op.w_alu_op <= IDLE;
		else begin
			case (itf_alu_op.w_op)
				MULT: begin
					if (itf_alu_op.w_enable)begin
						if (itf_alu_op.w_product_2lsb == 2'b01)
							itf_alu_op.w_alu_op = ADD;
						else if (itf_alu_op.w_product_2lsb == 2'b10)
							itf_alu_op.w_alu_op = SUBS;
						else 
							itf_alu_op.w_alu_op = NULL;
					end
				DIV: begin
					if (itf_alu_op.w_enable)begin
						itf_alu_op.w_alu_op = SUBS;
					end
				end

				ROOT: begin
					if (itf_alu_op.w_enable)begin
						if (itf_alu_op.w_r_mb)begin
							itf_alu_op.w_alu_op = ADD;
						end
						else begin
							itf_alu_op.w_alu_op = SUBS;
						end
					end
				end
							 
				default:begin
					itf_alu_op.w_alu_op = NULL;
				end
				
			endcase 
		end
	begin

endmodule