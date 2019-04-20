`ifndef REGISTER_SV
    `define REGISTER_SV

module register 
import pkg_system_mdr::*;
#(	
	parameter SDW   = 32  )
 (
	input 			clk,
	input 			rst,

	input logic [SDW-1:0]	i_val,

	output logic [SDW-1:0] 	o_val
);


always_ff @(posedge clk or negedge rst) begin
	if(~rst) 
		o_val <= '0;

	else 
		o_val <= i_val;

end

endmodule
`endif