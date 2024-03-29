/*-----------------------------------------------
* MODULE: 	  ms.sv
* DESCRITION: Top level of the system
* INPUTS: 	  i_product, i_sign, i_ready
* OUTPUTS:    o_led (16 - 0), o_ready
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module ms
import pkg_mult::*;
(
	/*Inputs*/
	input 		i_clk,
	input 		i_rst,
	input 		i_start,
	input		i_sw0,
	input		i_sw1,
	input		i_sw2,
	input		i_sw3,
	input		i_sw4,
	input		i_sw5,
	input		i_sw6,
	input		i_sw7,
	input		i_sw8,
	input		i_sw9,
	input		i_sw10,
	input		i_sw11,
	input		i_sw12,
	input		i_sw13,
	input		i_sw14,
	input		i_sw15,
	input		i_sw16,
	input		i_sw17,

	/*Output*/
	output		o_led0,
	output		o_led1,
	output 		o_led2,
	output		o_led3,
	output		o_led4,
	output		o_led5,
	output		o_led6,
	output		o_led7,
	output		o_led8,
	output		o_led9,
	output		o_led10,
	output		o_led11,
	output		o_led12,
	output		o_led13,
	output		o_led14,
	output		o_led15,
	output		o_led16,
	output		o_led17,
	output 		o_ready
);

	ms_t	wires_ms;
	
	/*PLL generates 10khz*/
	PLL PLL_HZ(
		.inclk0				(i_clk),
		
		.c0					(wires_ms.clkPLL)
	);
	
	/*The 10Khz generated by PLL are reduced to 2Hz*/
	clkDivider CLOCK_DIVIDER(
		.i_reset			(i_rst),
		.i_clk_FPGA			(wires_ms.clkPLL),
		
		.o_clk				(wires_ms.clk)
	);
	
	/*The switches register the value and send the value into two registers*/
	switch SW(
		.i_clk			(i_clk),
		.i_rst			(i_rst),
		.i_sw0			(i_sw0),
		.i_sw1			(i_sw1),
		.i_sw2			(i_sw2),
		.i_sw3			(i_sw3),
		.i_sw4			(i_sw4),
		.i_sw5			(i_sw5),
		.i_sw6			(i_sw6),
		.i_sw7			(i_sw7),
		.i_sw8			(i_sw8),
		.i_sw9			(i_sw9),
		.i_sw10			(i_sw10),
		.i_sw11			(i_sw11),
		.i_sw12			(i_sw12),
		.i_sw13			(i_sw13),
		.i_sw14			(i_sw14),
		.i_sw15			(i_sw15),
		.i_sw16			(i_sw16),
		.i_sw17			(i_sw17),
		
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
	
	/*Shows the value in the leds in the FPGA*/
	leds LED(
		.i_product	(wires_ms.finalProduct),
		.i_sign		(wires_ms.finalSign),
		.i_stop   	(wires_ms.ready),
		
		.o_led0		(o_led0),
		.o_led1		(o_led1),
		.o_led2		(o_led2),
		.o_led3		(o_led3),
		.o_led4		(o_led4),
		.o_led5		(o_led5),
		.o_led6		(o_led6),
		.o_led7		(o_led7),
		.o_led8		(o_led8),
		.o_led9		(o_led9),
		.o_led10	(o_led10),
		.o_led11	(o_led11),
		.o_led12	(o_led12),
		.o_led13	(o_led13),		
		.o_led14	(o_led14),
		.o_led15	(o_led15),
		.o_led16	(o_led16),
		.o_led17 (o_led17),
		.o_ready	(o_ready)
	);

endmodule
