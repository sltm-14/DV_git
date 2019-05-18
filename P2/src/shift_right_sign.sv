`ifndef SHIFT_RIGHT_SIGN_SV
    `define SHIFT_RIGHT_SIGN_SV
    
module shift_right_sign
import pkg_system_mdr::*;
(
	input clk,
	input rst,
	input signed[DW:0]		i_reg,
	input data_in_t			i_product,
	
	output data_mult_a_t		o_product
);

data_mult_a_t	r_product;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_product	<=	'0;
	else
		r_product	<=	{i_product[DW-1],i_product,i_reg[DW:1]};
end

assign o_product 	=	r_product;

endmodule
`endif
