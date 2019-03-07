module ms#(
	parameter DW = 8 
	)(
	input 			i_clk,
	input 			i_rst,
	input 			i_start,
	input  [DW-1:0] i_multd_val,
	input  [DW-1:0] i_multr_val,

	output 	[16:0] o_rc,
	output 			o_stop
	);

	wire 		   w_load;
	wire		   w_add;
	wire		   w_shift;
	wire  		   w_lsb;
	wire           w_carry;
	wire  [DW-1:0] w_multd_ripple_valA;
	wire  [DW-1:0] w_multr_ripple_valB;
	wire  [DW-1:0] w_sum;

	control SM(
		.i_clk	 (i_clk),
		.i_rst 	 (i_rst),
		.i_start (i_start),
		.i_lsb	 (w_lsb),

		.o_load	 (w_load),
		.o_add	 (w_add),
		.o_shift (w_shift),
		.o_stop	 (o_stop)
	);

	ff_d MULTIPLICAND(
		.i_clk	 (i_clk),
		.i_rst 	 (i_rst),
		.i_load	 (w_load),
		.i_data	 (i_multd_val), 		// [DW-1:0]

		.o_out	 (w_multd_ripple_valA) // [DW-1:0]
	);

	ripple_adder R_ADD(
		.i_valA	 (w_multd_ripple_valA), // [AW-1:0]
		.i_valB	 (w_multr_ripple_valB), // [AW-1:0]

		.o_sum	 (w_sum), // [AW-1:0]
		.o_carry (w_carry)
	);

	multiplier MULTIPLIER(
		.i_clk	 (i_clk),
		.i_rst   (i_rst),
		.i_load  (w_load),
		.i_shift (w_shift),
		.i_add   (w_add),
		.i_sum 	 ({w_carry,w_sum}), 		// [DW:0]
		.i_val   (i_multr_val), // [DW-1:0]

		.o_lsb 	(w_lsb),
		.o_rc 	(o_rc),
		.o_rb 	(w_multr_ripple_valB)
	);

endmodule