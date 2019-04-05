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
(
	input clk,
	input rst,
	input i_load,
	input i_op,
	input i_start,
	input data_t i_data,
	
	output data_t o_result,
	output o_ready,
	output o_loadX,
	output o_loadY,
	output o_error
	output data_t o_reaminder
);

mdr_if	top_itf();

switch SWITCH
(
	.clk				(clk),
	.rst				(rst),
	.switch_if		(top_if.switch)
);

pipo PIPO_DATA1
(
	.clk				(clk),
	.rst				(rst),
	.pipo_if			(top_itf.pipo)
);

pipo PIPO_DATA2
(
	.clk				(clk),
	.rst				(rst),
	.pipo_if			(top_itf.pipo)
);

control CONTROL
(
	.clk				(clk),
	.rst				(rst),
	.control_if		(top_itf.control)
);

validation VALIDATION
(
	.clk				(clk),
	.rst				(rst),
	.validation_if	(top_itf.validation)
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
	.led_if			(top_itf.led)
);

endmodule

`endif
