`ifndef MULTIPLICATION_SV
    `define MULTIPLICATION_SV

module multiplication
import pkg_system_mdr::*;
(
	input 					clk,
	input 					rst,
	input signed[15:0]   i_multiplier,
	input signed[15:0] 	i_multiplicand,
	input 		    		i_enable,
	input signed[32:0] 	i_alu_result,
	input count8_t			i_count,
	input 					i_done,
	
	output op_t				o_op,
	//output signed[32:0]	o_product_out,
	output signed[32:17]	o_product_out,
	output signed[15:0]	o_multiplicand,
	output					o_ready,
	output signed[32:0]  o_result
);

st_mult	wires;

operation_mult			OPERATION
(
	.i_msb2				(wires.msb2),
	.o_op					(o_op)
);

product_reg				PRODUCT
(
	.clk					(clk),
	.rst					(rst),
	.i_multiplier		(i_multiplier),
	.i_enable			(i_enable),
	.i_ovf				(i_done),
	.i_init				(i_count),
	.i_product			(wires.product_in),
	
	.o_product			(o_product_out),
	.o_msb2				(wires.msb2)
);

multiplicand_reg 		MULTIPLICAND
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(i_enable),
	.i_reg				(i_multiplicand),
	
	.o_reg				(o_multiplicand)
);

/*
alu ALU
(
	.i_selector			(w_msb2),
	.i_data				(w_product_out),
	.i_multiplicand	(w_multiplicand),
	
	.o_result			(w_alu_result)
);
*/

shift_right_sign 		SRS
(
	.clk					(clk),
	.rst					(rst),
	.i_product			(i_alu_result),
	
	.o_product			(wires.product_in)
);
/*
counter 					COUNT
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(i_enable),
	
	.o_counter			(wires.count),
	.o_ovf				(wires.ovf)
);
*/
final_product 			FINAL
(
	.clk					(clk),
	.rst					(rst),
	.i_flag				(i_done),
	.i_data				(wires.product_in),
	
	.o_data				(o_result),
	.o_ready				(o_ready)
);

endmodule //multiplication
`endif