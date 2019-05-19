`ifndef REGISTER_EN_SV
    `define REGISTER_EN_SV

module register_en 
import mxv_pkg::*;
(
	input 			clk,
	input 			rst,

	input           i_enable,
	input result_t	i_val,

	output result_t o_val
);


always_ff @(posedge clk or negedge rst) begin
	if(~rst) 
		o_val <= '0;
	else if (i_enable)
		o_val <= i_val;
	else 
		o_val <= '0;

end

endmodule
`endif