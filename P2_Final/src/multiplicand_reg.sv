`ifndef MULTIPLICAND_REG_SV
    `define MULTIPLICAND_REG_SV
    
module multiplicand_reg
import pkg_system_mdr::*;
(
	input	clk,
	input rst, 
	input i_enable,
	input signed[15:0]	i_reg,
	output signed[15:0] o_reg
);

logic signed[15:0] r_reg;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_reg <= '0;
	else if(i_enable)
		r_reg <= i_reg;
	else 
		r_reg <= r_reg;
end

assign o_reg = r_reg;

endmodule 
`endif