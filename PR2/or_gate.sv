`ifndef OR_GATE_SV
    `define OR_GATE_SV

module or_gate
import pkg_system_mdr::*;(

	if_mdr.or_gate or_if

	);

/* 	input  w_val_data,
	input  w_val_rem,

	input  w_val_or */

	assign or_if.w_val_or = ( or_if.w_val_data | or_if.w_val_rem );

endmodule
`endif