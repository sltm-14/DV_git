`ifndef ADDRS_SYNCH_SV
    `define ADDRS_SYNCH_SV

module addrs_synch
import fifo_pkg::*;
(
	input logic clk,
	input logic rst,

	input addr_t addr_1,
	input addr_t addr_2,

	output logic flag
);

addr_synch_st wires;

bin2gray BIN2GRAY_EMPTY(
	.bin  (addr_1), 

	.gray (wires.addr_bin_synch) 
);

synch_ff DUAL_FF_EMPTY(
	.clk (clk), 
	.rst (rst),

	.async_i (wires.addr_bin_synch), 

	.synch_o (wires.addr_synch_gray) 
);

gray2bin GRAY2BIN_EMPTY(
    .gray (wires.addr_synch_gray), 

    .bin (wires.addr_gray_comp) 
);

comp COMP_EMPTY(
	.val_a_i (wires.addr_gray_comp), 
	.val_b_i (addr_2), 

	.flag_o (flag)
);
endmodule
`endif
