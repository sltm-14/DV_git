/*-----------------------------------------------
* MODULE: 	  	leds.sv
* DESCRIPTION: Shows the state of the system
*					
* INPUTS: 	  	clock, reset and control signals:
*					stop, ready, loadX, loadY, error				
* OUTPUTS:    	Control signals: ready, loadX, loadY,
*					error
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef LEDS_SV
    `define LEDS_SV
	 
module leds
import system_mdr_pkg::*;
(
	input 			clk, 
	input 			rst, 
	
	output			o_loadX,
	output			o_loadY,
	output			o_ready,
	output			o_error,
	
	mdr_if.led		led_if
);

assign o_loadX	=	(led_if.o_loadX_ctrl) ? ON:	'0;
assign o_loadY	=	(led_if.o_loadY_ctrl) ? ON:	'0;
assign o_error	=	(led_if.o_error_ctrl) ? ON:	'0;
assign o_ready	=	(led_if.o_ready_ctrl) ? ON:	'0;

endmodule

`endif
