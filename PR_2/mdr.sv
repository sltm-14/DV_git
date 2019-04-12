`ifndef MDR_SV
    `define MDR_SV

module MDR_SV
import pkg_system_mdr::*;
(
	input clk,
	input rst,

	input             i_start,
	input             i_load,
	input data_in_t   i_data,
	input op_t        i_op,

	output data_t     o_result,
	output reminder_t o_reminder,
	output            o_load_x,
	output            o_load_y,
	output            o_error

	);




endmodule // MDR_SV