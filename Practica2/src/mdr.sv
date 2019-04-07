/*-----------------------------------------------
* MODULE: 	  	mdr.sv
* DESCRIPTION: Top level of the MDR system
* INPUTS: 	  	clock, reset, load, operation code, 
*					start and data
* OUTPUTS:    	result, loadX flag, loadY flag,
*					error flag and remainder
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef MDR_SV
    `define MDR_SV

module mdr
import system_mdr_pkg::*;
import pkg_bin_to_thto::*;
(
	input 				clk,
	input 				rst,
	input 				i_load,
	input op_t 			i_op,
	input 				i_start,
	input data_t 			i_data,
	
	output 				o_ready,
	output 				o_loadX,
	output 				o_loadY,
	output 				o_error
	output t_display 		o_displays_result,
	//output t_display	o_displays_remainder,
	output            		o_sign 

);

mdr_if	top_itf();

switch SWITCH
(
	.clk				(clk),
	.rst				(rst),
	.i_sw				(i_data),
	.switch_if			(top_itf.switch)
);

control CONTROL
(
	.clk				(clk),
	.rst				(rst),
	.i_load				(i_load),
	.i_op				(i_op),
	.i_start			(i_start),
	.control_if			(top_itf.control)
);

validation VALIDATION
(
	.clk				(clk),
	.rst				(rst),
	.validation_if			(top_itf.validation)
);

core MDR
(
	.clk				(clk),
	.rst				(rst),
	.core_if			(top_itf.core)
);

leds LEDS
(	
	.clk				(clk),
	.rst				(rst),
	.led_if				(top_itf.led),
	
	.o_loadX			(o_loadX),
	.o_loadY			(o_loadY),
	.o_ready			(o_ready),
	.o_error			(o_error)
);

TOP_bcd_7seg	TOP_BCD 
(
	.bcd_if				(top_itf.bcd),
	
	.out_displays_result		(o_displays_result),
	//.out_displays_remainder	(o_displays_remainder),
	.out_Signo			(o_sign)
);

endmodule

`endif
