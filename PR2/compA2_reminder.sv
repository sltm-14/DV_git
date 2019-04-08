`ifndef COMPA2_REMINDER_SV
    `define MDR_SV

module compA2_reminder
import pkg_system_mdr::*;(

	if_mdr.compA2_rem comp_A2rem

	);

assign comp_A2rem.w_rem_X_a2 = (comp_A2rem.w_rem_X[DW-1] ) ? ( ~( comp_A2rem.w_rem_X - 1'b1)) : comp_A2rem.w_rem_X; 

endmodule
`endif