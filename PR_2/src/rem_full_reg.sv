`ifndef REM_FULL_REG_SV
    `define REM_FULL_REG_SV
	 
module rem_full_reg
import pkg_system_mdr::*;
(
	input 					clk, 
	input 					rst,
	input signed[32-1:0]		i_result,
	input signed[15:0]		i_remainder,
	input 					i_flag,
	
	output signed[15:0]	o_register
);

logic signed[15:0]		r_register;


always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_register <= '0;
		
	else if(i_result[32-1] & i_flag)
		r_register <= i_remainder;
		
	else if((~i_result[32-1]) & i_flag)
		r_register <= i_result;
		
	else 
		r_register <= r_register;
end

assign o_register = r_register;

endmodule //division
`endif
