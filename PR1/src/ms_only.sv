module ms_for_simulation
	import mult_pkg::*;
	(
	input 			i_clk,
	input 			i_rst,
	input 			i_start,
	input  [DW-1:0] i_mltnd_val,
	input  [DW-1:0] i_mlter_val,

	output 	[D2W-1:0] o_product
	);

	wire 		    w_load;
	wire  		    w_lsb;
	wire  		    w_clean;
	wire			w_ready;
	wire  [D2W-1:0] w_mltnd_out;
	wire  [D2W-1:0] w_mlter_out;
	wire 			w_mltr_done;

	sign_reg	SIGN(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_load(wires_ms.load),
		.i_val1(wires_ms.sign_mlter),
		.i_val2(wires_ms.sign_mltnd),

		.o_val1(wires_ms.reg_mlter),
		.o_val2(wires_ms.reg_mltnd)
	);

	control SM(
		.i_clk	  	(i_clk),
		.i_rst 	  	(i_rst),
		.i_start  	(i_start),
		.i_mltr_done(wires_ms.mltr_done),


		.o_load   	(wires_ms.load),
		.o_clean  	(wires_ms.clean)
	);

	multiplicand MULTIPLICAND(
		.i_clk	 	(i_clk),
		.i_rst 	 	(i_rst),
		.i_load	 	(wires_ms.load),
		.i_stop  	(wires_ms.mltr_done),
		.i_data	 	(wires_ms.data_mltnd), 
 
		.o_data	 	(wires_ms.mltnd_out)  
	);

	multiplier MULTIPLIER(
		.i_clk		(i_clk),
		.i_rst  	(i_rst),
		.i_load 	(wires_ms.load),
		.i_data		(wires_ms.data_mlter), 

		.o_lsb 		(wires_ms.lsb),
		.o_done		(wires_ms.mltr_done)
	);

	adder ADDER(
		.i_clk	 	(i_clk),
		.i_rst	 	(i_rst),
		.i_stop   	(wires_ms.mltr_done),
		.i_enable   (wires_ms.lsb),
		.i_clean 	(wires_ms.clean), 	//[DW-1:0]
		.i_val	  	(wires_ms.mltnd_out), //[DW-1:0]

		.o_sum   	(o_product)	//[D2W:0]
	);



endmodule