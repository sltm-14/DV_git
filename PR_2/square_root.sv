`ifndef SQUARE_ROOT_SV
    `define ROOT_SQUARE_SV

module square_root
import pkg_system_mdr::*;
(
	input clk,
	input rst,

	input data_t    i_alu_result,
	input data_in_t i_val_x,
	input 		    i_enable,
	input 		    i_init,
	input count8_t   i_counter,

	//output o_result,
	//output o_reminder,
	output data_t   o_root_alu_a,
	output data_t   o_root_alu_b,
	output alu_op_t o_root_op

);

st_root_square rs;


shift_left #(1,32) QUOTIENT(
	.clk(clk),
	.rst(rst),

	.i_val(rs.or_op_q_q),
	.i_enable(i_enable),

	.o_val(rs.q_val)
);

shift_left #(2,32) Q_SHIFT(
	.clk(clk),
	.rst(rst),

//	.i_val('0),
	.i_val(rs.q_val),
	.i_enable(i_enable),

	.o_val(rs.qs_or)
);

root_op_calc OPCALCROOT(
	.clk(clk),
	.rst(rst),
	.i_r_msb(rs.r_val[DW2-1]),
	.i_alu_msb(i_alu_result[DW2-1]),
	.i_init(i_init),

	.o_or_q(rs.op_or_q),
	.o_or_alu(rs.op_or_alu),
	.o_op_val(o_root_op)

);

or_gate OR_QS_OP_ALU(
	.i_val_a(rs.qs_or),
	.i_val_b(rs.op_or_alu),

	.o_val(o_root_alu_b)
);

or_gate OR_Q_OP_Q(
	.i_val_a(rs.op_or_q),
//	.i_val_b('0),
	.i_val_b(rs.q_val),

	.o_val(rs.or_op_q_q)
);

shift_left #(2,32) REMINDER(
	.clk       (clk),
	.rst       (rst),

	.i_val     (i_alu_result),
	.i_enable  (i_enable),

	.o_val     (rs.r_val)
);

/*shift_reg_right #(2,16) DATA(
	.clk(clk),
	.rst(rst),

	.i_val(i_val_x),
	.i_init(i_init),
	.i_enable(i_enable),

	.o_val(rs.d_and)
);*/

shift_reg_right_data #(16) DATA(
	.clk    (clk),
	.rst    (rst),

	.i_counter    (i_counter),
	.i_val        (i_val_x),
	.i_init       (i_init),
	.i_enable     (i_enable),

	.o_val        (rs.d_and)
);

and_gate AND_D_3_ALU(
	.i_val_a    ({16'b0000_0000_0000_0000,rs.d_and}),
	.i_val_b    (3),

	.o_val      (rs.and_or)
);

or_gate OR_R_D_ALU(
	.i_val_a    (rs.r_val),
	.i_val_b    (rs.and_or),

	.o_val      (o_root_alu_a)
);



endmodule // square_root
`endif