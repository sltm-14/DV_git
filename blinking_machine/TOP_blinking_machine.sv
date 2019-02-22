module blinking_machine(
	input  i_clk,
	input  i_rst,
	input  i_start,

	output o_out,
	output o_clk_1hz
	);

wire 	   w_clk_1hz;
wire 	   w_timeout;
wire [2:0] w_count_ena;

clk_divider CD(
	.i_rst(i_rst), 
	.i_clk_FPGA(i_clk),
	
	.o_clk(w_clk_1hz)
);

blinking_SM SM(
	.i_clk(w_clk_1hz),
	.i_rst(i_rst),
	.i_start(i_start),
	.i_ena(w_timeout),

	.o_out(o_out),
	.o_count_ena(w_count_ena)
);

counter COUNT(
	.i_clk(w_clk_1hz),
	.i_rst(i_rst),
	.i_val(w_count_ena),

	.o_timeout(w_timeout),
);

assign o_clk_1hz = w_clk_1hz;

endmodule