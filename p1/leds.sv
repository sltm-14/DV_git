/*-----------------------------------------------
* MODULE: 	  leds.sv
* DESCRITION: outputs for leds
* INPUTS: 	  i_product, i_sign, i_ready
* OUTPUTS:    o_led (16 - 0), o_ready
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module leds
import leds_pkg::*;
(
	/*Inputs*/
	input	product_t 	i_product,
	input					i_sign,
	input 				i_stop,

	/*Outputs*/
	output				o_led0,
	output				o_led1,
	output 				o_led2,
	output				o_led3,
	output				o_led4,
	output				o_led5,
	output				o_led6,
	output				o_led7,
	output				o_led8,
	output				o_led9,
	output				o_led10,
	output				o_led11,
	output				o_led12,
	output				o_led13,
	output				o_led14,
	output				o_led15,
	output				o_led16,
	output				o_ready
);

/*Assigns the value of product*/
assign o_led0 		= (i_stop) ? i_product[0]: '0;
assign o_led1 		= (i_stop) ? i_product[1]: '0;
assign o_led2 		= (i_stop) ? i_product[2]: '0;
assign o_led3 		= (i_stop) ? i_product[3]: '0;
assign o_led4 		= (i_stop) ? i_product[4]: '0;
assign o_led5 		= (i_stop) ? i_product[5]: '0;
assign o_led6 		= (i_stop) ? i_product[6]: '0;
assign o_led7 		= (i_stop) ? i_product[7]: '0;
assign o_led8 		= (i_stop) ? i_product[8]: '0;
assign o_led9 		= (i_stop) ? i_product[9]: '0;
assign o_led10 	= (i_stop) ? i_product[10]: '0;
assign o_led11 	= (i_stop) ? i_product[11]: '0;
assign o_led12 	= (i_stop) ? i_product[12]: '0;
assign o_led13 	= (i_stop) ? i_product[13]: '0;
assign o_led14 	= (i_stop) ? i_product[14]: '0;
assign o_led15 	= (i_stop) ? i_product[15]: '0;
assign o_led16 	= (i_stop) ? i_sign: '0;
assign o_ready 	= i_stop;

endmodule
