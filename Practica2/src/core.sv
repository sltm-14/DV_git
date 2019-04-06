/*-----------------------------------------------
* MODULE: 	  	core.sv
* DESCRIPTION: Module MDR, instances from multiplication
*					division and square root				
* INPUTS: 	  	clock, reset, dataX, dataY, enable
* OUTPUTS:    	Done flag, result and remainder
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef CORE_SV
    `define CORE_SV
	 
module core
import system_mdr_pkg::*;
(
	input 			clk,
	input 			rst,
	mddr_if.core	core_if
	
	output data_t 	o_reaminder,
	output data_t 	o_result,
);

	multiplier MULT
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		.i_dataY(),
		
		.o_product()
	);
	
	division DIV
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		.i_dataY(),
		
		.o_quotation(),
		.o_remainder()
	);
	
	root ROOT
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		
		.o_quotation(),
		.o_remainder()
	);
	
endmodule

`endif