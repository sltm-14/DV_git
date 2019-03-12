module switch_sim
import switch_pkg::*;
(
	input				i_clk,
	input				i_rst,
	input	[17:0]		i_sw,
	
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
		r_data.multiplier	<= i_sw[8:0];
		r_data.multiplicand	<= i_sw[17:9];
	end
end: SWITCH 

assign o_multiplier 	= r_data.multiplier;
assign o_multiplicand 	= r_data.multiplicand;

endmodule
