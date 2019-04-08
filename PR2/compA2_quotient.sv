`ifndef COMPA2_QUOTIENT_SV
    `define COMPA2_QUOTIENT_SV

module compA2_quotient
import pkg_system_mdr::*;(

	if_mdr.compA2_quo comp_A2quo

	);

/* 	input   w_rem_X,

	output  w_quo_X_a2 */

assign comp_A2quo.w_quo_X_a2 = (comp_A2quo.w_rem_X[DW-1] ) ? ( ~( comp_A2quo.w_rem_X - 1'b1)) : comp_A2quo.w_rem_X; 

endmodule 
`endif