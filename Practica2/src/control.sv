/*-----------------------------------------------
* MODULE: 	  	control.sv
* DESCRIPTION: State machine of the system
* INPUTS: 	  	clock, reset, operation code, start,
*					done, error			
* OUTPUTS:    	Error, ready, loadX, loadY, enable
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/

`ifndef CONTROL_SV
    `define CONTROL_SV
	 
module control
import system_mdr_pkg::*;
(
	input					clk,
	input 				rst,

	mdr_if.control		control_if
);



endmodule
`endif



	