`ifndef OR_GATE_SV
    `define OR_GATE_SV
    
module or_gate
import pkg_system_mdr::*;
(
	input data_t	i_val_a,
	input data_t	i_val_b,

	output data_t 	o_val
);

assign o_val	=	i_val_a | i_val_b ;

endmodule
`endif