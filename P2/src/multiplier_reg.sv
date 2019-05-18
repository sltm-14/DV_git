`ifndef MULTIPLIER_REG_SV
    `define MULTIPLIER_REG_SV
    
module multiplier_reg
import pkg_system_mdr::*;
(
	input					clk,
	input 				rst, 
	input 				i_enable,
	input data_in_t	i_reg,
	output data_in_t 	o_reg
);

data_in_t	r_reg;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_reg		<= '0;
	else if(i_enable)
		r_reg 	<= i_reg;
	else 
		r_reg 	<= r_reg;
end

assign o_reg 	= r_reg;

endmodule 
`endif