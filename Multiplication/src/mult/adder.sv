
module adder
import mult_pkg::*;
(
	input					i_clk,   		/* Clk signal */
	input 					i_rst,			/* Rst signal */
	input					i_stop,		/* Ready signal */
	input 					i_enable,		/* Enable signal */
	input   				i_clean,		/* Clean signal */
	input multiplicand_t	i_val,			/* Value to be added */

	output product_t		o_sum			/* Result of addition */
);

product_t	r_product;

always@(posedge i_clk) begin:add
	if (i_clean)  	   /* Celan de value of product */
		r_product <= '0; 
	else if (i_enable) /* If enable exist add de input value to product... */
		r_product <= r_product + i_val;
	else			   /* ...if not, product keeps its value */
		r_product <= r_product; 
end:add
 
 /* o_sum gets the value of product */
assign o_sum = (i_stop)? r_product : '0;

endmodule 