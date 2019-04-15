`ifndef ROOT_OP_CALC_SV
    `define ROOT_OP_CALC_SV

module root_op_calc
import pkg_system_mdr::*;
(
	input   clk,
	input   rst,
	input   		    i_r_msb,
	input               i_alu_msb,
	input               i_init,

	output data_t 		o_or_q,
	output data_t 		o_or_alu,
	output alu_op_t 	o_op_val
);


always @(posedge clk or negedge rst) begin
	if (i_alu_msb)
		o_or_q 	 = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	else 
		o_or_q 	 = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	
	if (i_init)begin
		o_or_q 	 = '0;
		o_or_alu = '0;
		o_op_val = ZERO;
	end
	else 
	if(i_r_msb)begin
		o_op_val = ADD;
		o_or_alu =  3;
	end
	else begin
		o_op_val = SUBS;
		o_or_alu = 1;
	end



end

endmodule 
`endif