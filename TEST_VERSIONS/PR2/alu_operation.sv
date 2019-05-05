`ifndef ALU_OPERATION_SV
    `define ALU_OPERATION_SV

module alu_operation
import pkg_system_mdr::*;(
	input				clk,
	input 				rst,

	if_mdr.alu_op itf_alu_op
	);

/* 	input [1:0] w_rem_2lsb,
	input 		w_enable,
	op_t		w_op,

	output 		w_alu_op */

	always@(*) begin

		
			case (itf_alu_op.w_op)
				MULT: begin
					if (itf_alu_op.w_enable)begin
						if (itf_alu_op.w_rem_2lsb == 2'b01)
							itf_alu_op.w_alu_op = ADD;
						else if (itf_alu_op.w_rem_2lsb == 2'b10)
							itf_alu_op.w_alu_op = SUBS;
						else 
							itf_alu_op.w_alu_op = NULL;
					end
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
							if (itf_alu_op.w_ovf)
								itf_alu_op.w_alu_op = ADD;
							else
								itf_alu_op.w_alu_op = SUBS;
						end
					end
				end
							 
				default: begin
					itf_alu_op.w_alu_op = NULL;
				end
				
			endcase 
		
	end

endmodule
`endif