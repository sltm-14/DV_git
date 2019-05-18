`ifndef SELECTOR_OP_SV
    `define SELECTOR_OP_SV
	 
module selector_op
import pkg_system_mdr::*;
(
	input 				i_enable,
	input op_select_t i_op,
	
	output logic[3:0]	o_op
);

logic [3:0] r_op;

always_comb begin
	if(i_enable) begin
		case(i_op)
			MULT: 
				r_op = 4'b0001;
			DIV:
				r_op = 4'b0010;
			ROOT:
				r_op = 4'b0100;
			NON:
				r_op = 4'b1000;
			default:
				r_op = 4'b0000;
		endcase
	end
	else
		r_op = '0;
end

assign o_op = r_op;

endmodule 
`endif