`ifndef FINAL_PRODUCT_SV
    `define FINAL_PRODUCT_SV

module final_product
import pkg_system_mdr::*;
(
	input 					clk,
	input 					rst, 
	input 					i_flag,
	input data_mult_a_t	i_data,
	
	output 					o_ready,
	output data_t 			o_data
);

data_t	r_data;
logic 	r_ready;

always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_data 	<= '0;
		r_ready 	<= '0;
	end
	else if(~i_flag) begin
		r_data 	<= r_data;
		r_ready 	<= '0;
	end
	else begin
		r_data 	<= i_data[DW2:1];
		r_ready 	<= 1'b1;
	end
end

assign o_data 	= r_data;
assign o_ready = i_flag;

endmodule
`endif
 