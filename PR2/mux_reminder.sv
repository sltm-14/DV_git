`ifndef MUX_REMINDER_SV
    `define MUX_REMINDER_SV

module mux_reminder
import pkg_system_mdr::*;(

	if_mdr.mux_rem mux
	);

/* 	input 	w_op,
	input 	w_rem_X,
	input 	w_rem_X_a2,

	output 	w_mux_rem  */

	always_comb begin
		case (mux.w_op)
			MULT:begin
				mux.w_mux_rem = mux.w_rem_X;
			end
			DIV: begin
				mux.w_mux_rem = mux.w_rem_X_a2;
			end
			ROOT: begin
				mux.w_mux_rem = mux.w_rem_X_a2;
			end
			default:
				mux.w_mux_rem = mux.w_rem_X_a2;

		endcase
	end

endmodule
`endif