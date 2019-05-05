/*-----------------------------------------------
* MODULE: 	  adder.sv
* DESCRITION: Adds the multiplicand to the register
					depends on the LSB of multiplier
					if LSB of multiplier is one, then
					adds the value
* INPUTS: 	  clock, reset, stop , enable, clean and val
* OUTPUTS:    sum
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module adder
import pkg_mult::*;
(
	input					i_clk,   		/* Clk signal */
	input 					i_rst,			/* Rst signal */
	input					i_stop,			/* Ready signal */
	input 					i_enable,		/* Enable signal */
	input   				i_clean,			/* Clean signal */
	input multiplicand_t	i_val,			/* Value to be added */

	output product_t		o_sum				/* Result of addition */
);

product_t	r_product;

always@(posedge i_clk) begin:add
	if (i_clean)  	   						/* Celan de value of product */
		r_product <= '0; 
	else if (i_enable) 						/* If enable exist add de input value to product... */
		r_product <= r_product + i_val;
	else			   							/* ...if not, product keeps its value */
		r_product <= r_product; 
end:add
 
 /* o_sum gets the value of product */
assign o_sum = (i_stop)? r_product : '0;

endmodule 