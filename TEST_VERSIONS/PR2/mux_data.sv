`ifndef MUX_DATA_SV
    `define MUX_DATA_SV

module mux_data
import pkg_system_mdr::*;(
	if_mdr.mux_data mux
	);

/* 	input   w_op,
	input 	w_data_Y,
	input 	w_data_Y_a2,

	output 	w_data_val */

	always_comb begin
		case (mux.w_op)
			MULT:begin
				mux.w_data_val = mux.w_data_Y;
			end
			DIV: begin
				mux.w_data_val = mux.w_data_Y_a2;
			end
			ROOT: begin
				mux.w_data_val = mux.w_data_Y_a2;
			end
			default:
				mux.w_data_val = mux.w_data_Y_a2;

		endcase
	end

	

endmodule
`endif