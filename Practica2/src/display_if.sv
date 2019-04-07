/*-----------------------------------------------
* MODULE: 	  	display_if.sv
* DESCRIPTION: Interface with modports of the
*					display the modules					
*					error
* VERSION:    	1.0
* AUTHORS:    	Andres Hernandez, Carem Acosta
* DATE:       	05 / 04 / 19
* ----------------------------------------------*/
`ifndef DISPLAY_IF_SV
	`define DISPLAY_IF_SV

interface display_if ();
import pkg_bin_to_thto;

t_iv	o_Val_com;
t_fv	o_Full_Val_thto;


modport complement
(
	output	o_Val_com
);

modport thto
(
	input	o_Val_com,
	
	output	o_Full_Val_thto
);

modport display
(
	input	o_Full_Val_thto,
);
endinterface

`endif
