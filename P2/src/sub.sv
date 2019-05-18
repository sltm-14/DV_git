`ifndef SUB_SV
    `define SUB_SV
    
module sub
import pkg_system_mdr::*;
(
	input data_t		i_rem,
	input data_t		i_div,
	input 				i_flag,
	
	output data_t		o_sub,
	output 				o_flag
);

logic 		r_flag;
data_t		r_sub;

always_comb begin
	if(i_flag) begin
		r_sub 	=	i_rem - i_div;
		r_flag 	=	1'b1;
	end
	else begin
		r_sub 	= '0;
		r_flag 	= '0;
	end
end

assign o_flag 	= r_flag;
assign o_sub 	= r_sub;

endmodule
`endif