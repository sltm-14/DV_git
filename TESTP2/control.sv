`ifndef CONTROL_SV
    `define CONTROL_SV
module control
import system_mdr_pkg::*;
(
	input	clk,
	input rst,
	input i_load,
	input i_op,
	input i_start,
	input i_done,
	input i_error,
	
	output o_error,
	output o_ready,
	output o_loadX,
	output o_loadY,
	output enb_t o_enable
);


endmodule
`endif



	