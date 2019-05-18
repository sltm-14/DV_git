`ifndef PRODUCT_REG_SV
    `define PRODUCT_REG_SV
    
module product_reg
import pkg_system_mdr::*;
(
	input 						clk,
	input 						rst, 
	input data_in_t			i_multiplier,
	input 						i_ovf,
	input data_mult_a_t		i_product,
	input							i_enable,
	input counter_t			i_init,
	
	output data_mult_a_t		o_product,
	output [1:0]				o_msb2
);

data_mult_a_t	r_val	=	'0;
data_in_t 		r_pro =	'0;
logic 		 	r_q1  =	'0;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_val		<=	'0;
		
	else if(i_init == '0)
		r_val 	<= {r_pro, i_multiplier, r_q1};
		
	else if((~i_ovf) & (i_enable))
		r_val 	<= i_product;
		
end

assign o_product 	=	r_val;
assign o_msb2 		= 	{r_val[1],r_val[0]};

endmodule
`endif
