`ifndef SHIFT_RIGHT_SIGN_SV
    `define SHIFT_RIGHT_SIGN_SV
    
module shift_right_sign
import pkg_system_mdr::*;
(
	input clk,
	input rst,
	input signed[32:0] i_product,
	
	output signed[32:0]	o_product
);

logic signed[32:0] r_product;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_product <= '0;
	else
		r_product <= i_product>>>1;
end

assign o_product = r_product;

endmodule
`endif
