`ifndef SHIFT_RIGHT_SV
    `define SHIFT_RIGHT_SV
    
module shift_right 
import pkg_system_mdr::*;
#(	parameter SHIFT = 1
)(
	input 			clk,
	input 			rst,

	input data_t 	i_val,
	input 			i_enable,

	output data_t 	o_val
);


always_ff @(posedge clk or negedge rst) begin
	if(~rst) 
		o_val <= '0;
	
	else if (i_enable)
		o_val <= i_val << SHIFT;

	else
		o_val <= i_val;

end

endmodule
`endif