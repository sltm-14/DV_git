`ifndef FINAL_REMAINDER_SV
    `define FINAL_REMAINDER_SV

module final_remainder
import pkg_system_mdr::*;
(
	input 			clk,
	input 			rst, 
	input 			i_done,
	input data_t	i_data,
	
	output logic	o_ready,
	output data_t 	o_data
);

data_t 	r_data;
logic 	r_ready = '0;

always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_data 	<= '0;
		r_ready 	<= '0;
	end
	else if(~i_done) begin
		r_data 	<= r_data;
		r_ready 	<= '0;
	end
	else begin
		r_data 	<= i_data;
		r_ready 	<= 1'b1;
	end
end

assign o_ready = r_ready;
assign o_data 	= r_data;

endmodule
`endif
 