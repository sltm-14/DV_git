`ifndef MUX_RD_SV
    `define MUX_RD_SV

module mux_rd
import pkg_system_mdr::*;(

	if_mdr.mux_rd mux

	);

/*	input 	w_op,
	input  	w_val_or,
	input  	w_val_data,

	output 	w_mux_data_alu */

	always_comb begin
		case (mux.w_op)
			MULT:begin
				mux.w_mux_data_alu = mux.w_val_data;
			end
			DIV: begin
				mux.w_mux_data_alu = mux.w_val_data;
			end
			ROOT: begin
				mux.w_mux_data_alu = mux.w_val_or;
			end
			default:
				mux.w_mux_data_alu = mux.w_val_data;
		endcase
	end

endmodule
`endif