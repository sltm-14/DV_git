
`ifndef VALIDATION_SV
    `define VALIDATION_SV
	 
module validation
import pkg_system_mdr::*;
(
	input						clk,
	input 					rst, 

	mdr_if.validation		validation_if
);




endmodule
`endif