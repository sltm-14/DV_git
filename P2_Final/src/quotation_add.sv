`ifndef QUOTATION_ADD_SV
    `define QUOTATION_ADD_SV
    
module quotation_add
import pkg_system_mdr::*;
(
	input 			i_msb,
	input 			i_flag,
	input 			i_enable,
	input signed[15:0]	i_quotation,
	
	output signed[15:0]	o_quotation,
	output 			o_msb,
	output 			o_flag
);

logic signed[15:0]	r_quotation =	'0;

always_comb begin
	if(i_flag & i_enable)
		r_quotation 	=	i_quotation << 1;
	else
		r_quotation 	=	'0;
end

assign o_quotation	=	r_quotation;
assign o_msb 			=	i_msb;
assign o_flag 			=	i_flag;

endmodule
`endif