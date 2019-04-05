/*-----------------------------------------------
* MODULE: 	  leds.sv
* DESCRIPTION: Shows the state of the system
*					
* INPUTS: 	  clock, reset and control signals:
*					stop, ready, loadX, loadY, error				
* OUTPUTS:    Control signals: ready, loadX, loadY,
*					error
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       05 / 04 / 19
* ----------------------------------------------*/

`ifndef LEDS_SV
    `define LEDS_SV
	 
module leds
import system_mdr_pkg::*;
(
	input 			clk, 
	input 			rst, 

	mdr_if.led		led_if
);

assign led_if.o_leds[0]	=	(led_if.i_stop) ? led_if.i_loadX:	'0;
assign led_if.o_leds[1]	=	(led_if.i_stop) ? led_if.i_loadY:	'0;
assign led_if.o_leds[2]	=	(led_if.i_stop) ? led_if.i_error:	'0;
assign led_if.o_leds[3]	=	(led_if.i_stop) ? led_if.i_ready:	'0;

endmodule

`endif
