`ifndef OPERATION_MULT_SV
    `define OPERATION_MULT_SV

module operation_mult
import pkg_system_mdr::*;
(
	input [1:0] i_msb2,
	output op_t	o_op
);

op_t	r_op;

always_comb begin
	case(i_msb2)
		2'b00:
			r_op = 2'b00;
		2'b01:
			r_op = 2'b10;
		2'b10:
			r_op = 2'b01;
		2'b11:
			r_op = 2'b00;
		default:
			r_op = 2'b11;
	endcase
end

assign o_op = r_op;

endmodule
`endif