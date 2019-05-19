`ifndef REGISTER_EN_SV
    `define REGISTER_EN_SV

module register_en_dw_8
import pkg_uart::*;
 (
	input  clk,
	input  rst,
	
	input         i_ena,
	input  data_t i_val,

	output data_t o_val
);


always_ff @(posedge clk, negedge rst) begin
	if(!rst) 
		o_val <= '0;

	else if (i_ena)
		o_val <= i_val;

end



endmodule
`endif