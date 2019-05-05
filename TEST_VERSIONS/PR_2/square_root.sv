`ifndef SQUARE_ROOT_SV
    `define ROOT_SQUARE_SV

module square_root
import pkg_system_mdr::*;
(
	input clk,
	input rst,

	input 		    i_init,
	input 		    i_enable,
	input data_in_t i_val_x,
	input data_t    i_alu_result,
	input           i_alu_msb,
	input count8_t  i_counter,

	output data_t   o_root_alu_a,
	output data_t   o_root_alu_b,
	output alu_op_t o_root_op,
	output data_t   o_result,
	output data_t   o_reminder

);

st_root_square rs;


shift_left #(2,32) REMINDER(
	.i_val     (i_alu_result),
	.i_enable  (i_enable),

	.o_val     (rs.r_val)
);

shift_reg_right_data #(16) DATA(
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
	.i_val_a    (rs.and_or),
	.i_val_b    (rs.r_val),

	.o_val      (o_root_alu_a)
);

root_op_calc OPCALCROOT(
	.clk       (clk),
	.rst       (rst),

	.i_alu_msb (i_alu_result[DW2-1]),
	.i_msb     (i_alu_msb),
	.i_init    (i_init),
	.i_enable  (i_enable),

	.o_or_q    (rs.op_or_q),
	.o_or_alu  (rs.op_or_alu),
	.o_op_val  (o_root_op)
);

register #(1) REG_ENA(
	.clk       (clk),
	.rst       (rst),

	.i_val     (i_enable),

	.o_val     (rs.r_bit)
);

shift_left #(1,32) QUOTIENT(
	.i_enable (rs.r_bit),
	.i_val    (rs.r_reg_val),

	.o_val    (rs.q_val)
);

or_gate OR_Q_OP_Q(
	.i_val_a  (rs.op_or_q),
	.i_val_b  (rs.q_val),

	.o_val    (rs.or_op_q_q)
);


register_en #(DW2) REG_OR_Q(
	.clk      (clk),
	.rst      (rst),

	.i_val    (rs.or_op_q_q),
	.i_enable (i_enable),

	.o_val    (rs.r_reg_val)
);


shift_left #(2,32) Q_SHIFT(
	.i_enable (i_enable),
	.i_val    (rs.or_op_q_q),


	.o_val    (rs.qs_or)
);

or_gate OR_QS_OP_ALU(
	.i_val_a (rs.op_or_alu),
	.i_val_b (rs.qs_or),

	.o_val   (o_root_alu_b)
);

final_values #(DW2) REM_QUO(
	.i_reminder(rs.r_val),
	.i_quotient(rs.or_op_q_q),

	.o_reminder(o_reminder),
	.o_quotient(o_result)
);



endmodule // square_root
`endif