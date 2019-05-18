`ifndef REGISTER_EN_SV
    `define REGISTER_EN_SV

module register_en 
import pkg_system_mdr::*;
#(	
	parameter SDW   = 32  )
 (
	input 						clk,
	input 						rst,
	input logic [SDW-1:0]	i_val,
	input                   i_enable,

	output logic [SDW-1:0] 	o_val
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