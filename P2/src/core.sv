`ifndef CORE_SV
    `define CORE_SV
    
module core
import pkg_system_mdr::*;
(
	input					clk,
	input 				rst, 
	input  				i_enable,
	input					i_init,
	input					i_clean,
	input data_in_t	i_dataX,
	input data_in_t	i_dataY,
	input op_select_t i_op,
	
	output 				o_done,
	output data_t		o_result,
	output data_t		o_remainder
);

st_mdr  wires;

selector_op				SELECTOR
(
	.i_enable			(i_enable),
	.i_op					(i_op),
	
	.o_op					(wires.mdr_enabler)
);

counter2	#(LIM_MULT)	COUNTER_MULT
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(wires.mdr_enabler[0]),
	
	.o_counter			(wires.counter_mult),
	.o_ovf				(wires.ovf_mult)
);

counter2	#(LIM_DIV)	COUNTER_DIV
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(wires.mdr_enabler[1]),
	
	.o_counter			(wires.counter_div),
	.o_ovf				(wires.ovf_div)
);

counter #(LIM_ROOT) 	COUNT_ROOT
(
	.clk         		(clk),
	.rst         		(rst),
	.i_enable    		(wires.mdr_enabler[2]),

	.o_counter   		(wires.counter_root),
	.o_ovf       		(wires.ovf_root)
);

mux_2powerN #(2,2) 	MUX_ALU_OP 
(
	.i_buses 			({2'b00,
							wires.alu_op_root,
							wires.alu_op_div,
							wires.alu_op_mult}),  
	.i_sltr  			(i_op),  

	.o_bus   			(wires.alu_op)  
);

mux_data					MUX_ALU_A
(
	.i_mult				(wires.mult_alu_a[DW2:DW+1]),
	.i_div				(wires.div_alu_a),
	.i_root				(wires.root_alu_a),
	.i_null				('0),
	.i_selector			(i_op),
	
	.o_dataM				(wires.alu_a_M),
	.o_dataDR			(wires.alu_a_DR)
);

mux_data					MUX_ALU_B
(
	.i_mult				(wires.mult_alu_b),
	.i_div				(wires.div_alu_b),
	.i_root				(wires.root_alu_b),
	.i_null				('0),
	.i_selector			(i_op),
	
	.o_dataM				(wires.alu_b_M),
	.o_dataDR			(wires.alu_b_DR)
);

alu_mult 				ALU
(
	.i_init   			(i_init),
	.i_enable			(i_enable),
	.i_val_a_M  		(wires.alu_a_M),
	.i_val_b_M  		(wires.alu_b_M),
	.i_val_a_DR  		(wires.alu_a_DR),
	.i_val_b_DR  		(wires.alu_b_DR),
	.i_sltr   			(wires.alu_op),
	.i_flag				(wires.flag_rem),
	.i_op					(i_op),

	.o_val_M    		(wires.alu_result_M),
	.o_val_DR			(wires.alu_result_DR),
	.o_flag				(wires.flag_sub)
);

register #(DW2) 		REG_ALU
(
	.clk          		(clk),
	.rst          		(rst),
	.i_val				(wires.alu_result_DR),

	.o_val				(wires.alu_result_reg)
);

multiplication 		MULTIPLICATION
(
	.clk					(clk),
	.rst					(rst),
	.i_multiplicand	(i_dataX),
	.i_multiplier		(i_dataY),
	.i_enable			(wires.mdr_enabler[0]),
	.i_alu_result		(wires.alu_result_M),
	.i_count				(wires.counter_mult),
	.i_done				(wires.ovf_mult),
	
	.o_op					(wires.alu_op_mult),
	.o_product_out		(wires.mult_alu_a),
	.o_multiplicand	(wires.mult_alu_b),
	.o_result			(wires.result_mult),
	.o_ready				(wires.ready_mult)
);

division 				DIVISION
(
	.clk					(clk),
	.rst					(rst),
	.i_dividend			(i_dataX),
	.i_divisor			(i_dataY),
	.i_enable			(wires.mdr_enabler[1]),
	.i_sub				(wires.alu_result_DR),
	.i_flag_sub			(wires.flag_sub),
	.i_count				(wires.counter_div),
	.i_done				(wires.ovf_div),
	
	.o_ready				(wires.ready_div),
	.o_remainder		(wires.remainder_div),
	.o_quotation		(wires.result_div),
	.o_remainder_alu	(wires.div_alu_a),
	.o_divisor			(wires.div_alu_b),
	.o_flag_rem			(wires.flag_rem),
	.o_op					(wires.alu_op_div)
);

square_root 			SQUARE_ROOT
(
	.clk          		(clk),
	.rst          		(rst),
	.i_alu_result 		(wires.alu_result_reg),
	.i_val_x      		(i_dataX),
	.i_enable     		(wires.mdr_enabler[2]),
	.i_init       		(i_init),
	.i_counter    		(wires.counter_root),
	.i_alu_msb    		(wires.alu_result_DR[DW2-1]),
	.i_done				(wires.ovf_root),

	.o_result     		(wires.result_root),
	.o_reminder   		(wires.remainder_root),
	.o_root_alu_a 		(wires.root_alu_a),
	.o_root_alu_b 		(wires.root_alu_b),
	.o_root_op    		(wires.alu_op_root),
	.o_ready				(wires.ready_root)
);

mux_output				MUX_OUT
(
	.i_result_mult		(wires.result_mult),
	.i_result_div		(wires.result_div),
	.i_result_root		(wires.result_root),
	.i_remainder_div	(wires.remainder_div),
	.i_remainder_root	(wires.remainder_root),
	.i_ready_mult		(wires.ready_mult),
	.i_ready_div		(wires.ready_div),
	.i_ready_root		(wires.ready_root),
	.i_selector			(i_op),
	
	.o_result			(o_result),
	.o_remainder		(o_remainder),
	.o_ready				(o_done)
);

endmodule 
`endif