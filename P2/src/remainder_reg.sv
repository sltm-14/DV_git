`ifndef REMAINDER_REG_SV
    `define REMAINDER_REG_SV
    
module remainder_reg
import pkg_system_mdr::*;
(
	input 				clk, 
	input 				rst, 
	input data_in_t 	i_dividend, 
	input data_t 		i_remainder,
	input 				i_enable, 
	input 				i_flag,
	input counter_t	i_init,
	
	output data_t 		o_remainder,
	output 				o_flag,
	output op_t			o_op
);

data_t 	r_rem;
logic 	r_flag;
op_t		r_op;

always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_rem 	<= '0;
		r_flag 	<= '0;
		r_op		<= 2'b11;
	end 
	else if(i_init == '0) begin
		r_rem 	<=	{{(DW){1'b0}}, i_dividend};
		r_flag 	<= 1'b1;
		r_op		<= 2'b01;
	end
	else if(i_enable & i_flag) begin
		r_rem 	<= i_remainder;
		r_flag 	<= 1'b1;
		r_op		<= 2'b01;
	end 
	else if(i_enable & (~i_flag)) begin
		r_rem 	<= r_rem;
		r_flag 	<= '0;
		r_op		<= 2'b01;
	end
end

assign o_remainder 	=	r_rem;
assign o_flag 			=	r_flag;
assign o_op				= 	r_op;

endmodule
`endif