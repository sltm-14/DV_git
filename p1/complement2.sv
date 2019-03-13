/*-----------------------------------------------
* MODULE: 	  complement2.sv
* DESCRITION: Converts the sign data to 
					unsigned data and saves the sign 
					in other register
* INPUTS: 	  i_val, i_start
* OUTPUTS:    o_val, o_sign
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module complement2
import comp2_pkg::*;
(
	/*Inputs*/
	input 	val_t	i_val,
	
	/*Ouputs*/
	output	out_t	o_val,
	output			o_sign
);

/*El MSB indica si el signo es positivo o negativo, en caso de ser 
positivo se hace complemento A2  de lo contrario el valor continua igual */
comp2_t comp2;

always_comb begin: inputs
	comp2.val 	= ( i_val[DW] ) ? ( ~(i_val[DW-1:0] - 1'b1)) : i_val[DW-1:0]; 
	comp2.sign 	= i_val[DW];
end: inputs

/* Value after A2 complement */
assign o_val   = comp2.val;
/* Sign after A2 complement */
assign o_sign  = comp2.sign;
	
endmodule
