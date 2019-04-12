`ifndef ROOT_SQUARE_SV
    `define ROOT_SQUARE_SV

module root_square
import pkg_system_mdr::*;
(
	input clk,
	input rst,

	input data_t i_alu_result,
	input data_t i_val_x,
	input 		 i_enable,
	input 		 i_init,

	//output o_result,
	//output o_reminder,
	output data_t o_root_alu_a,
	output data_t o_root_alu_b,
	output alu_op_t o_root_op

);

st_root_square rs;




shift_left QUOTIENT(
	.clk(clk),
	.rst(rst),

	.i_val(rs.or_op_q_q),
	.i_enable(i_enable),

	.o_val(rs.q_val)
);

shift_left Q_SHIFT(
	.clk(clk),
	.rst(rst),

	.i_val(rs.q_val),
	.i_enable(i_enable),

	.o_val(rs.qs_or)
);

root_op_calc OPCALCROOT(
	.i_r_msb(rs.r_val[DW2-1]),

	.o_or_q(rs.op_or_q),
	.o_or_alu(rs.op_or_alu),
	.o_op_val(o_root_op)

);

or_gate OR_QS_OP_ALU(
	.i_val_a(rs.qs_or),
	.i_val_b(rs.op_or_alu),

	.o_val(o_root_alu_a)
);

or_gate OR_Q_OP_Q(
	.i_val_a(rs.q_val),
	.i_val_b(rs.op_or_q),

	.o_val(rs.or_op_q_q)
);

shift_left REMINDER(
	.clk(clk),
	.rst(rst),

	.i_val(i_alu_result),
	.i_enable(i_enable),

	.o_val(rs.r_val)
);

shift_reg_right DATA(
	.clk(clk),
	.rst(rst),

	.i_val(i_val_x),
	.i_init(i_init),
	.i_enable(i_enable),

	.o_val(rs.d_and)
);

and_gate AND_D_3_ALU(
	.i_val_a(rs.d_and),
	.i_val_b(3),

	.o_val(rs.and_or)
);

or_gate OR_R_D_ALU(
	.i_val_a(rs.r_val),
	.i_val_b(rs.and_or),

	.o_val(o_root_alu_b)
);



endmodule // square_root
`endif