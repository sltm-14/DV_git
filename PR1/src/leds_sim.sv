/*-----------------------------------------------
* MODULE: 	  leds.sv
* DESCRITION: outputs for leds
* INPUTS: 	  i_product, i_sign, i_ready
* OUTPUTS:    o_led (16 - 0), o_ready
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module leds_sim
import pkg_mult::*;
(

	input	product_t 	i_product,
	input				i_sign,
	input 				i_stop,
	
	output	leds_t	 	o_led,
	output				o_ready
);

assign o_led[D2W-1'b1:0] = (i_stop) ? i_product : '0 ;
assign o_led[D2W]   	 = (i_stop) ? i_sign    : '0 ;

assign o_ready = i_stop;

endmodule

