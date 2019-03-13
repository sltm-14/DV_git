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
	input    		i_clk,	/* Clk */
	input    		i_rst,	/* Rst */
	input	product_t	i_val,		/* Input value */
	input					i_signA,	/* Input sign */
	input					i_signB,	/* Input sign */
	input					i_stop,
	input					i_start,
	
	output	product_t	o_product,	/* Product of complement */
	output					o_sign		/* Signal of complement */
);

product_t r_product  ='0;
product_t r_val;
logic r_sign = '0;

always @(posedge i_clk, negedge i_rst) begin
	if (!i_rst)begin
		r_product  <= '0;
		r_sign <= '0;
	end
	else begin
		if (i_stop) begin
			r_product <= (i_signA ^ i_signB) ? (~i_val) + 1'b1 : i_val;
			r_sign <= (i_signA ^ i_signB);
		end
		else begin
			r_product <= r_product;
			r_sign <= r_sign;
		end
	end
end

//assign   r_val = i_start ? '0 : r_val;
//assign   r_sign = i_start ? '0 : r_sign;
//
//assign   r_val = (i_signA ^ i_signB) ? (~i_val) + 1'b1 : i_val;
//assign	r_product = (i_stop) ? r_val : r_product;
//assign	r_sign = (i_stop)? (i_signA ^ i_signB) : r_sign;



/* Calculate A2 complement if needed */
assign o_product 	= r_product;
/* Calculate output sign */
assign o_sign = r_sign;		

endmodule
