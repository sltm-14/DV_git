`ifndef DIVISION_SV
    `define DIVISION_SV
	 
module division
import pkg_system_mdr::*;
(
	input 					clk, 
	input 					rst, 
	input signed[15:0] 	i_dividend,
	input signed[15:0] 	i_divisor,
	input 					i_enable,
	input signed[15:0]	i_sub,
	input						i_flag_sub,
	input						i_count,
	input						i_done,
	
	output 					o_ready,
	output signed[15:0] 	o_remainder,
	output signed[15:0] 	o_quotation,
	output signed[31:0]	o_remainder_in,
	output signed[31:0]	o_divisor,
	output 					o_flag_rem
);

st_div	wires;

remainder_reg 		REMAINDER
(
	.clk				(clk), 
	.rst				(rst),
	.i_dividend		(i_dividend),
	.i_remainder	(wires.remainder_out),
	.i_enable		(i_enable),
	.i_init			(i_count),
	.i_flag			(wires.flag_div),
	
	.o_remainder	(wires.remainder_in),
	.o_flag			(wires.flag_rem)
);
/*
sub SUB
(
	.i_rem			(w_remainder_in),
	.i_div			(w_divisor),
	.i_flag			(w_flag_rem),
	
	.o_sub			(w_sub),
	.o_flag			(w_flag_sub)
);
*/
rem_full_reg 		FULL
(
	.clk				(clk),
	.rst				(rst),
	.i_result		(i_sub),
	.i_remainder	(wires.remainder_in),
	.i_flag			(i_flag_sub),
	
	.o_register		(wires.remainder_out)
);

divisor_reg 		DIVISOR
(
	.clk				(clk),
	.rst				(rst),
	.i_divisor		(i_divisor),
	.i_flag			(i_flag_sub),
	.i_init			(i_count),
	
	.o_divisor		(wires.divisor),
	.o_flag			(wires.flag_div)
);

quotation_add 		QUOTATION_ADD
(
	.i_msb			(wires.sub[D2W-1]),
	.i_flag			(i_flag_sub),
	.i_quotation	(wires.quotationFull),
	.i_enable		(i_enable),
	
	.o_quotation	(wires.quotation),
	.o_msb			(wires.msb),
	.o_flag			(wires.flag_quo)
);

quotation_reg 		QUOTATION
(
	.clk				(clk),
	.rst				(rst),
	.i_msb			(wires.msb),
	.i_enable		(i_enable),
	.i_flag			(wires.flag_quo),
	.i_quotation	(wires.quotation),
	
	.o_quotation	(wires.quotationFull)
);
/*
counter COUNT
(
	.clk				(clk),
	.rst				(rst),
	.i_enable		(i_enable),
	
	.o_counter		(wires.count),
	.o_ovf			()
);
*/
endmodule //division
`endif