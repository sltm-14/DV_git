`ifndef SHIFT_LEFT_SV
    `define SHIFT_LEFT_SV

module shift_left 
import pkg_system_mdr::*;
#(	parameter SHIFT = 1	,
	parameter SDW   = 32  )
 (
	input logic [SDW-1:0]	i_val,
	input 			        i_enable,

	output data_t 	        o_val
);

always_comb begin

	if (i_enable)
		o_val <= i_val << SHIFT;

	else
		o_val <= i_val;

end

endmodule
`endif