`ifndef REM_FULL_REG_SV
    `define REM_FULL_REG_SV
	 
module rem_full_reg
import pkg_system_mdr::*;
(
	input 					clk, 
	input 					rst,
	input data_t			i_result,
	input data_t			i_remainder,
	input 					i_flag,
	
	output data_t			o_register
);

data_t		r_register;


always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_register <= '0;
		
	else if(i_result[DW2-1] & i_flag)
		r_register <= i_remainder;
		
	else if((~i_result[DW2-1]) & i_flag)
		r_register <= i_result;
		
	else 
		r_register <= r_register;
end

assign o_register = r_register;

endmodule //division
`endif
