`ifndef REMAINDER_REG_SV
    `define REMAINDER_REG_SV
    
module remainder_reg
import pkg_system_mdr::*;
(
	input clk, 
	input rst, 
	input signed[15:0] 	i_dividend, 
	input signed[31:0] 	i_remainder,
	input i_enable, 
	input i_flag,
	input [7:0] i_init,
	
	output signed[31:0] o_remainder,
	output o_flag
);

logic signed[31:0] r_rem;
logic r_flag;


always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_rem <= '0;
		r_flag <= '0;
	end 
	else if(i_init == '0) begin
		r_rem <= {4'b0, i_dividend};
		r_flag <= '1;
	end
	else if(i_enable & (i_flag)) begin
		r_rem <= i_remainder;
		r_flag <= 1'b1;
	end 
	else if(i_enable & (~i_flag)) begin
		r_rem <= r_rem;
		r_flag <= '0;
	end
end

assign o_remainder = r_rem;
assign o_flag = r_flag;

endmodule
`endif