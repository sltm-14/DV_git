`ifndef DIVISOR_REG_SV
    `define DIVISOR_REG_SV
    
module divisor_reg
import pkg_system_mdr::*;
(
	input 					clk, 
	input 					rst,
	input signed[15:0]		i_divisor,
	input [7:0] 			i_init,
	input 					i_flag,
	
	output signed[15:0]	o_divisor,
	output 					o_flag
);

logic signed[15:0]	r_divisor;
logic 		r_flag;


always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_divisor 	<= '0;
		r_flag 		<= '0;
	end
	
	else if(i_init == '0) begin
		r_divisor 	<= {i_divisor, 4'b0};
		r_flag 		<= '0;
	end
	
	else if((i_flag)&(i_init > '0)) begin 
		r_divisor 	<= r_divisor>>>1;
		r_flag 		<= 1'b1;
	end
	
	else begin
		r_divisor 	<= r_divisor;
		r_flag 		<= '0;
	end
	
end

assign o_divisor 	=	r_divisor;
assign o_flag 		=  r_flag;

endmodule 
`endif