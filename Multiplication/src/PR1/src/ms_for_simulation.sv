module ms_for_simulation#(
	parameter DW = 8,
	parameter D2W = DW*2
	)(
	input 			i_clk,
	input 			i_rst,
	input 			i_start,
	input  [DW-1:0] i_mltnd_val,
	input  [DW-1:0] i_mlter_val,

	output 	[D2W-1:0] o_product,
	output 		      o_stop
	);

	wire 		    w_load;
	wire  		    w_lsb;
	wire  		    w_clean;
	wire			w_ready;
	wire  [D2W-1:0] w_mltnd_out;
	wire  [D2W-1:0] w_mlter_out;
	wire 			w_mltr_done;

	control SM(
		.i_clk	  	(i_clk),
		.i_rst 	  	(i_rst),
		.i_start  	(i_start),
		.i_mltr_done(w_mltr_done),

		.o_load   (w_load),
		.o_ready  (o_stop),
		.o_clean  (w_clean)
	);

	multiplicand MULTIPLICAND(
		.i_clk	 (i_clk),
		.i_rst 	 (i_rst),
		.i_load	 (w_load),
		.i_stop  (w_mltr_done),
		.i_data	 (i_mltnd_val), // [DW-1:0]

		.o_data	 (w_mltnd_out)  // [DW-1:0]
	);

	multiplier MULTIPLIER(
		.i_clk	(i_clk),
		.i_rst  (i_rst),
		.i_load (w_load),
		.i_data	(i_mlter_val), 

		.o_lsb 	(w_lsb),
		.o_done	(w_mltr_done)
	);

	adder ADD(
		.i_clk	  (i_clk),
		.i_rst	  (i_rst),
		.i_enable (w_lsb),
		.i_stop   (w_mltr_done),
		.i_clean  (w_clean), 	
		.i_val    (w_mltnd_out), 

		.o_sum    (o_product)	
	);



endmodule