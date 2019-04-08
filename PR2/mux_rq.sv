`ifndef MUX_RQ_SV
    `define MUX_RQ_SV

module mux_rq
import pkg_system_mdr::*;(

	if_mdr.mux_rq mux
	);

/* 	input 	w_op,
	input  	w_rem_val,
	input  	w_quo_val,

	output w_mux_rem_alu */

	always_comb begin
		case (mux.w_op)
			MULT:begin
				mux.w_mux_rem_alu = mux.w_rem_val;
			end
			DIV: begin
				mux.w_mux_rem_alu = mux.w_rem_val;
			end
			ROOT: begin
				mux.w_mux_rem_alu = mux.w_quo_val;
			end
			default:
				mux.w_mux_rem_alu = mux.w_rem_val;
		endcase
	end

endmodule
`endif