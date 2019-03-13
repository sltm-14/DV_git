/*-----------------------------------------------
* MODULE: 	  comp2Product.sv
* DESCRITION: Applies A2 complement if needed
* INPUTS: 	  i_val, i_signA, i_signB
* OUTPUTS:    o_product, o_sign
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module comp2Product
import comp2_pkg::*;
(
	input	product_t	i_val,			/* Input value */
	input					i_signA,			/* Input sign */
	input					i_signB,			/* Input sign */
	
	output	product_t	o_product,	/* Product of complement */
	output					o_sign		/* Signal of complement */
);

/* Calculate A2 complement if needed */
assign o_product 	= (i_signA ^ i_signB) ? ((~i_val) + 1'b1) : i_val;
/* Calculate output sign */
assign o_sign 		= (i_signA ^ i_signB);

endmodule
