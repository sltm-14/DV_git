`ifndef SHIFT_REG_RIGHT_DATA_SV
    `define SHIFT_REG_RIGHT_DATA_SV
    
module shift_reg_right_data 
import pkg_system_mdr::*;
#(	
	parameter SDW   = 32 )
 (
/*	input clk,
	input rst,
*/
	input logic [SDW-1:0] 	i_val,
	input count8_t          i_counter,
	input 			        i_init,
	input 			        i_enable,

	output logic [SDW-1:0] 	o_val
);

data_t r_val = '0;
always_comb begin
/*always_ff @(posedge clk or negedge rst) begin
	if(~rst) begin
		r_val <= '0;
		o_val <= r_val;
	end
	
	else  */
	if (i_init)begin
		r_val <= i_val;
		o_val <= r_val;
	end
	
	else if (i_enable)begin
		r_val <= r_val;
		o_val <= r_val >> (i_counter*2);
	end

	else begin
		r_val <= r_val;
		o_val <= r_val;
	end

end



endmodule
`endif