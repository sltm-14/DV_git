`ifndef ROOT_OP_CALC_SV
    `define ROOT_OP_CALC_SV

module root_op_calc
import pkg_system_mdr::*;
(
	input   		i_r_msb,

	output data_t 		o_or_q,
	output data_t 		o_or_alu,
	output alu_op_t 	o_op_val
);


always_comb begin
	if(i_r_msb)begin
		o_or_q 	 = '0;
		o_or_alu =  3;
		o_op_val = ADD;
	end
	else begin
		o_op_val = SUBS;
		o_or_q 	 = 1;
		o_or_alu = 1;
	end
end

endmodule 
`endif