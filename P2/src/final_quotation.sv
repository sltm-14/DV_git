`ifndef FINAL_QUOTATION_SV
    `define FINAL_QUOTATION_SV

module final_quotation
import pkg_system_mdr::*;
(
	input 				clk,
	input 				rst, 
	input 				i_done,
	input data_in_t	i_data,
	
	output data_in_t 	o_data
);

data_in_t 	r_data;

always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_data 	<= '0;
	end
	else if(~i_done) begin
		r_data 	<= r_data;
	end
	else begin
		r_data 	<= i_data;
	end
end

assign o_data 	= r_data;

endmodule
`endif
 