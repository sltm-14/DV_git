`ifndef COMP_SV
    `define COPM_SV

module comp
import fifo_pkg::*;
(
	input addr_t  val_a_i,
	input addr_t  val_b_i,

	output  flag_o
);

assign flag_o = ( val_a_i == val_b_i )? 1'b1 : 0;

endmodule
`endif