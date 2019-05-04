`ifndef CORE_SV
    `define CORE_SV
    
module core
import pkg_system_mdr::*;
(
	input					clk,
	input 				rst, 
	input  				i_enable,
	input op_select_t i_op,
	input					i_init,
	input					i_clean,
	input data_in_t	i_dataX,
	input data_in_t	i_dataY,
	
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
/*
counter #(8) 			COUNT
(
	.clk         		(clk),
	.rst         		(rst),
	.i_enable    		(i_enable),

	.o_counter   		(wires.counter_8),
	.o_ovf       		(wires.ovf)
);
*/

counter					COUNTER2
(
	.clk					(clk),
	.rst					(rst),
	.i_enable			(i_enable),
	
	.o_counter			(wires.counter_8),
	.o_ovf				(wires.ovf)
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

mux_2powerN #(2,DW) MUX_ALU_A 
(
	.i_buses 			({16'b0000_0000_0000_0000,
							wires.root_alu_a,
							wires.div_alu_a ,
							wires.mult_alu_a}),  
	.i_sltr  			(i_op),  

	.o_bus   			(wires.alu_a)   
);

mux_2powerN #(2,DW) MUX_ALU_B 
(
	.i_buses 			({16'b0000_0000_0000_0000,
							wires.root_alu_b,
							wires.div_alu_b ,
							wires.mult_alu_b}),  
	.i_sltr  			(i_op),  

	.o_bus   			(wires.alu_b)   
);

alu ALU
(
	.i_init   			(i_init),
	.i_val_a  			(wires.alu_a),
	.i_val_b  			(wires.alu_b),
	.i_sltr   			(wires.alu_op),

	.o_val    			(wires.alu_result)
);

register #(DW2) 		REG_ALU
(
	.clk          		(clk),
	.rst          		(rst),
	.i_val				(wires.alu_result),

	.o_val				(wires.alu_result_reg)
);

multiplication 		MULTIPLICATION
(
	.clk					(clk),
	.rst					(rst),
	.i_multiplicand	(i_dataX),
	.i_multiplier		(i_dataY),
	.i_enable			(wires.mdr_enabler[0]),
	.i_alu_result		(wires.alu_result),
	.i_count				(wires.counter_8),
	.i_done				(wires.ovf),
	
	.o_op					(wires.alu_op_mult),
	.o_product_out		(wires.mult_alu_a),
	.o_multiplicand	(wires.mult_alu_b),
	.o_result			(o_result),
	.o_ready				(/*o_done*/)
);

division 				DIVISION
(
	.clk					(clk),
	.rst					(rst),
	.i_dividend			(i_dataX),
	.i_divisor			(i_dataY),
	.i_enable			(wires.mdr_enabler[1]),
	.i_sub				(wires.alu_result),
	.i_flag_sub			(),
	.i_count				(wires.counter_8),
	.i_done				(wires.ovf),
	
	.o_quotation		(/*o_result*/),
	.o_remainder		(/*o_remainder*/),
	.o_ready				(o_done),
	.o_remainder_in	(wires.div_alu_a),
	.o_divisor			(wires.div_alu_b),
	.o_flag_rem			()
);

square_root 			SQUARE_ROOT
(
	.clk          		(clk),
	.rst          		(rst),
	.i_alu_result 		(wires.alu_result_reg),
	.i_val_x      		(i_dataX),
	.i_enable     		(wires.mdr_enabler[2]),
	.i_init       		(i_init),
	.i_counter    		(wires.counter_8),
	.i_alu_msb    		(wires.alu_result[31-1]),

	.o_result     		(/*o_result*/),
	.o_reminder   		(/*o_remainder*/),
	.o_root_alu_a 		(wires.root_alu_a),
	.o_root_alu_b 		(wires.root_alu_b),
	.o_root_op    		(wires.alu_op_root)
);

endmodule 
`endif