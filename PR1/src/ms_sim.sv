module ms_sim
import pkg_mult::*;
(
	input 			i_clk,
	input 			i_rst,
	input 			i_start,
	input sw_in_t	i_sw,

	output	[DW2-1:0]	o_led,
	output 		   	o_ready
	
);

	ms_t	wires_ms;
			
	switch_sim SW(
		.i_clk		(i_clk),
		.i_rst		(i_rst),
		.i_sw		(i_sw),
		
		.o_multiplier	(wires_ms.real_mlter),
		.o_multiplicand	(wires_ms.real_mltnd)
	);
	
	/*Multiplicand is converted to absolute values*/
	complement2 COMP2_MULTIPLICAND(
		.i_val		(wires_ms.real_mltnd),
		
		.o_val		(wires_ms.data_mltnd),
		.o_sign		(wires_ms.sign_mltnd)
	);
	
	/*Multiplier is converted to absolute values*/
	complement2 COMP2_MULTIPLIER(
		.i_val		(wires_ms.real_mlter),
		
		.o_val		(wires_ms.data_mlter),
		.o_sign		(wires_ms.sign_mlter)
	);

	/*Holds the sign values*/
	sign_reg	SIGN(
		.i_clk		(i_clk),
		.i_rst		(i_rst),
		.i_load		(wires_ms.load),
		.i_val1		(wires_ms.sign_mlter),
		.i_val2		(wires_ms.sign_mltnd),

		.o_val1		(wires_ms.reg_mlter),
		.o_val2		(wires_ms.reg_mltnd)
	);

	/*State machine with three states*/
	control SM(
		.i_clk	  	(i_clk),
		.i_rst 	  	(i_rst),
		.i_start  	(i_start),

		.o_load   	(wires_ms.load),
		.o_clean  	(wires_ms.clean),
		.o_ready	(wires_ms.ready),
		.o_ovf		(wires_ms.ovf)
	);

	/*Calculates the multiplicand shifted*/
	multiplicand MULTIPLICAND(
		.i_clk	 	(i_clk),
		.i_rst 	 	(i_rst),
		.i_load	 	(wires_ms.load),
		.i_stop  	(wires_ms.ovf),
		.i_data	 	(wires_ms.data_mltnd), 
 
		.o_data	 	(wires_ms.mltnd_out)  
	);

	/*Calculates the LSB of multiplier*/
	multiplier MULTIPLIER(
		.i_clk		(i_clk),
		.i_rst  	(i_rst),
		.i_load 	(wires_ms.load),
		.i_data		(wires_ms.data_mlter), 

		.o_lsb 		(wires_ms.lsb)
	);

	/*Add the results of multiplicand*/
	adder ADDER(
		.i_clk	 	(i_clk),
		.i_rst	 	(i_rst),
		.i_stop   	(wires_ms.ready),
		.i_enable   (wires_ms.lsb),
		.i_clean 	(wires_ms.clean), 	
		.i_val	  	(wires_ms.mltnd_out), 

		.o_sum   	(wires_ms.product)
	);
	
	/*Converts the absolute value to two's complement*/
	comp2Product COMP2_PRODUCT(
		.i_val		(wires_ms.product),
		.i_signA	(wires_ms.reg_mltnd),
		.i_signB	(wires_ms.reg_mlter),

		
		.o_product	(wires_ms.finalProduct),
		.o_sign		(wires_ms.finalSign)
	);
	
	leds_sim LED(
		.i_product	(wires_ms.finalProduct),
		.i_sign		(wires_ms.finalSign),
		.i_stop   	(wires_ms.ready),
		
		.o_led		(o_led),
		.o_ready	(o_ready)
	);


endmodule
