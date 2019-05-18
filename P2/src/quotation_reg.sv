`ifndef QUOTATION_REG_SV
    `define QUOTATION_REG_SV
    
module quotation_reg
import pkg_system_mdr::*;
(
	input 				clk,
	input 				rst, 
	input 				i_msb,
	input 				i_flag,
	input 				i_enable,
	input data_in_t	i_quotation,
	
	output data_in_t	o_quotation
);

data_in_t	r_quotation;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_quotation 	<= '0;

	else if(i_enable) begin
		if(i_msb & i_flag) begin
			r_quotation <= {i_quotation[DW-1:1],1'b0};
		end
		
		else if((~i_msb) & i_flag) begin
			r_quotation <= {i_quotation[DW-1:1],1'b1};
		end
		
		else begin
			r_quotation <=  r_quotation;
		end
		
	end
	else 
		r_quotation 	<= '0;
end

assign o_quotation 	=	r_quotation;

endmodule
`endif