`ifndef MULTIPLICATION_SV
    `define MULTIPLICATION_SV

module multiplication
import pkg_system_mdr::*;
(
	input 						clk,
	input 						rst,
	input data_in_t		  	i_multiplier,
	input data_in_t 			i_multiplicand,
	input 		    			i_enable,
	input data_in_t			i_alu_result,
	input counter_t			i_count,
	input 						i_done,
	
	output op_t					o_op,
	output data_mult_a_t		o_product_out,
	output data_in_t			o_multiplicand,
	output						o_ready,
	output data_t				o_result
);

st_mult	wires;

operation_mult					OPERATION
(
	.i_msb2						(wires.msb2),
	.o_op							(o_op)
);

product_reg						PRODUCT
(
	.clk							(clk),
	.rst							(rst),
	.i_multiplier				(i_multiplier),
	.i_enable					(i_enable),
	.i_ovf						(i_done),
	.i_init						(i_count),
	.i_product					(wires.product_in),
	
	.o_product					(o_product_out),
	.o_msb2						(wires.msb2)
);

multiplicand_reg 				MULTIPLICAND
(
	.clk							(clk),
	.rst							(rst),
	.i_enable					(i_enable),
	.i_reg						(i_multiplicand),
	
	.o_reg						(o_multiplicand)
);

shift_right_sign 				SRS
(
	.clk							(clk),
	.rst							(rst),
	.i_reg						(o_product_out[DW:0]),
	.i_product					(i_alu_result),
	
	.o_product					(wires.product_in)
);

final_product 					FINAL
(
	.clk							(clk),
	.rst							(rst),
	.i_flag						(i_done),
	.i_data						(wires.product_in),
	
	.o_data						(o_result),
	.o_ready						(o_ready)
);

endmodule //multiplication
`endif