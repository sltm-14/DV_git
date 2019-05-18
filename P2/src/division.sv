`ifndef DIVISION_SV
    `define DIVISION_SV
	 
module division
import pkg_system_mdr::*;
(
	input 				clk, 
	input 				rst, 
	input data_in_t 	i_dividend,
	input data_in_t 	i_divisor,
	input 				i_enable,
	input data_t		i_sub,
	input					i_flag_sub,
	input counter_t	i_count,
	input					i_done,
	
	output logic 		o_ready,
	output data_t 		o_remainder,
	output data_in_t 	o_quotation,
	output data_t		o_remainder_alu,
	output data_t		o_divisor,
	output 				o_flag_rem,
	output op_t			o_op

);

st_div	wires;

remainder_reg 			REMAINDER
(
	.clk					(clk), 
	.rst					(rst),
	.i_dividend			(i_dividend),
	.i_remainder		(wires.remainder_out),
	.i_enable			(i_enable),
	.i_init				(i_count),
	.i_flag				(wires.flag_div),
	
	.o_remainder		(wires.remainder_in),
	.o_flag				(o_flag_rem),
	.o_op					(o_op)
);

rem_full_reg 			FULL
(
	.clk					(clk),
	.rst					(rst),
	.i_result			(i_sub),
	.i_remainder		(wires.remainder_in),
	.i_flag				(i_flag_sub),
	
	.o_register			(wires.remainder_out)
);

divisor_reg 			DIVISOR
(
	.clk					(clk),
	.rst					(rst),
	.i_divisor			(i_divisor),
	.i_flag				(i_flag_sub),
	.i_init				(i_count),
	
	.o_divisor			(o_divisor),
	.o_flag				(wires.flag_div)
);

quotation_add 			QUOTATION_ADD
(
	.i_msb				(i_sub[DW2-1]),
	.i_flag				(i_flag_sub),
	.i_quotation		(wires.quotationFull),
	.i_enable			(i_enable),
	
	.o_quotation		(wires.quotation),
	.o_msb				(wires.msb),
	.o_flag				(wires.flag_quo)
);

quotation_reg 			QUOTATION
(
	.clk					(clk),
	.rst					(rst),
	.i_msb				(wires.msb),
	.i_enable			(i_enable),
	.i_flag				(wires.flag_quo),
	.i_quotation		(wires.quotation),
	
	.o_quotation		(wires.quotationFull)
);

final_remainder		FINAL_REM
(
	.clk					(clk),
	.rst					(rst),
	.i_done				(i_done),
	.i_data				(wires.remainder_out),
	
	.o_ready				(o_ready),
	.o_data				(o_remainder)
);

final_quotation		FINAL_QUO
(
	.clk					(clk),
	.rst					(rst),
	.i_done				(i_done),
	.i_data				(wires.quotationFull),
	
	.o_data				(o_quotation)
);

assign o_remainder_alu = wires.remainder_in;

endmodule //division
`endif