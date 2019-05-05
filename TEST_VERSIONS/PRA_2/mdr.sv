`ifndef MDR_SV
    `define MDR_SV

module mdr
import pkg_system_mdr::*;
(
	input clk,
	input rst,

	input             i_start,
	input             i_load,
	input data_in_t   i_data,
	input op_select_t i_op,

/*	output reminder_t o_reminder,
	output data_t     o_result,*/
	output            o_load_x,
	output            o_load_y,
	output            o_error

	);

st_mdr  wires;
wire    w_clean;

counter #(8) COUNT(
	.clk         (clk),
	.rst         (rst),

	.i_enable    (wires.enable ),

	.o_counter   (wires.counter_8),
	.o_ovf       (wires.ovf)
);

control CTRL(
	.clk         (clk),
	.rst         (rst),

	.i_start     (i_start),
	.i_load      (i_load),
	.i_error     (1'b0),//(wires.error),
	.i_ovf       (wires.ovf),
	
	.o_clean     (w_clean),
	.o_load_x    (o_load_x),
	.o_load_y    (o_load_y),
	.o_save_x    (wires.save_x),
	.o_save_y    (wires.save_y),
	.o_veri      (wires.veri),
	.o_error_sig (o_error_sig),
	.o_enable    (wires.enable),
	.o_init      (wires.init),
	.o_ready     (wires.ready)

);

pipo PIPO_X(
	.clk    (clk),
	.rst    (rst),

	.i_ena  (wires.save_x),
	.i_data (i_data),

	.o_data (wires.data_x)
);

pipo PIPO_Y(
	.clk    (clk),
	.rst    (rst),

	.i_ena  (wires.save_y),
	.i_data (i_data),

	.o_data (wires.data_y)
);

demux_2powerN #(2,1) DEM_ENA(
	.i_bus   (wires.enable),  
	.i_sltr  (i_op),     

	.o_buses (wires.mdr_enabler)     
);

mux_2powerN #(2,2) MUX_ALU_OP (
	.i_buses ({2'b00,
	          wires.alu_op_root,
	          wires.alu_op_div,
	          wires.alu_op_mult}),  
	.i_sltr  (i_op),  

	.o_bus   (wires.alu_op)  
);

mux_2powerN #(2,DW2) MUX_ALU_A (
	.i_buses ({32'b0000_0000_0000_0000_0000_0000_0000_0000,
	          wires.root_alu_a,
	          wires.div_alu_a ,
	          wires.mult_alu_a}),  
	.i_sltr  (i_op),  

	.o_bus   (wires.alu_a)   
);

mux_2powerN #(2,DW2) MUX_ALU_B (
	.i_buses ({32'b0000_0000_0000_0000_0000_0000_0000_0000,
	          wires.root_alu_b,
	          wires.div_alu_b ,
	          wires.mult_alu_b}),  
	.i_sltr  (i_op),  

	.o_bus   (wires.alu_b)   
);

alu ALU(
/*	.clk      (clk),
	.rst      (rst),*/

	.i_init   (wires.init),
	.i_val_a  (wires.alu_a),
	.i_val_b  (wires.alu_b),
	.i_sltr   (wires.alu_op),

	.o_val    (wires.alu_result)
);

register #(DW2) REG_ALU(
	.clk          (clk),
	.rst          (rst),

	.i_val(wires.alu_result),

	.o_val(wires.alu_result_reg)
);

square_root SR(
	.clk          (clk),
	.rst          (rst),

	.i_alu_result (wires.alu_result_reg),
	.i_val_x      (wires.data_x),
	.i_enable     (wires.mdr_enabler[2]),
	.i_init       (wires.init),
	.i_counter    (wires.counter_8),
	.i_alu_msb    (wires.alu_result[DW2-1]),

	// .o_result     (),
	// .o_reminder   (),
	.o_root_alu_a (wires.root_alu_a),
	.o_root_alu_b (wires.root_alu_b),
	.o_root_op    (wires.alu_op_root)

);

endmodule // MDR_SV
`endif