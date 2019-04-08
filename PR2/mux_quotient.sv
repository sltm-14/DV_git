`ifndef MUX_QUOTIENT_SV
    `define MUX_QUOTIENT_SV

module mux_quotient
import pkg_system_mdr::*;(

	if_mdr.mux_quo mux
	);

/* 	input   w_op,
	input 	w_rem_X,
	input 	w_quo_X_a2,

	output 	w_mux_quo  */

	always_comb begin
		case (mux.w_op)
			MULT:begin
				mux.w_mux_quo = mux.w_rem_X;
			end
			DIV: begin
				mux.w_mux_quo = mux.w_quo_X_a2;
			end
			ROOT: begin
				mux.w_mux_quo = mux. w_quo_X_a2;
			end
			default:
				mux.w_mux_quo = mux.w_quo_X_a2;
		endcase
	end

endmodule
`endif