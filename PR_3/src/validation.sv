`ifndef VALIDATION_SV
    `define VALIDATION_SV
    
module validation
import mxv_pkg::*;
(
	input state_ctrl_t    state
	input logic           ena,
	input data_hex_sipo_t frame,

	output logic          match
);

	

endmodule 
`endif