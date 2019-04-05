/*-----------------------------------------------
* MODULE: 	  	validation.sv
* DESCRIPTION: If there is an math error, the module
*					detects the error and doesn't load the 
*					data, if there is not error the value
*					are loaded
* INPUTS: 	  	clock, reset, dataX and dataY	
* OUTPUTS:    	dataX, dataY and error flag
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef VALIDATION_SV
    `define VALIDATION_SV
	 
module validation
import system_mdr_pkg::*;
(
	input						clk,
	input 					rst, 

	mdr_if.validation		validation_if
);



endmodule
`endif