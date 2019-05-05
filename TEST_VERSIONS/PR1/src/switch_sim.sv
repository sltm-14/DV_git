module switch_sim
import pkg_mult::*;
(
	input				i_clk,
	input				i_rst,
	input	sw_sim_t	i_sw,
	
	output  data_t	o_multiplier,
	output  data_t	o_multiplicand
);

registers_t r_data;

always_ff@(posedge i_clk, negedge i_rst) begin: SWITCH 
	if(!i_rst) begin
		r_data.multiplier 	<= '0;
		r_data.multiplicand	<= '0;
	end
	else begin
		r_data.multiplier	<= i_sw[DW:0];
		r_data.multiplicand	<= i_sw[DW2+1:DW+1];
	end
end: SWITCH 

assign o_multiplier 	= r_data.multiplier;
assign o_multiplicand 	= r_data.multiplicand;

endmodule
