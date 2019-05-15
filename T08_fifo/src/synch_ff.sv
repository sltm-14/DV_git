`ifndef SYNCH_FF_SV
    `define SYNCH_FF_SV

module synch_ff
import fifo_pkg::*; 
(
	input clk, 
	input rst,

	input addr_t async_i, 

	output addr_t synch_o
);

addr_t data_w;

ff_d FF_D_1(
	.clk(clk),
	.rst(rst),

	.in(async_i),

	.out(data_w)
);

ff_d FF_D_2(
	.clk(clk),
	.rst(rst),

	.in(data_w),

	.out(synch_o)
);

endmodule
`endif