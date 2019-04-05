
`ifndef DIVISION_SV
    `define DIVISION_SV
module division
import system_mdr_pkg::*;
(
	input clk,
	input reset,
	input i_enable,
	input i_dataX,
	input i_dataY,
	
	output data_t o_quotation,
	output data_t o_remainder
);


endmodule
`endif