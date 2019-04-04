
`ifndef VALIDATION_SV
    `define VALIDATION_SV
module validation
import system_mdr_pkg::*;
(
	input	clk,
	input rst, 
	input data_t i_dataX,
	input data_t i_dataY,
	
	output o_error,
	output data_t o_dataX,
	output data_t o_dataY
);




endmodule
`endif