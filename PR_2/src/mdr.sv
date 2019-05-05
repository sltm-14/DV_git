`ifndef MDR_SV
    `define MDR_SV

module mdr
import pkg_system_mdr::*;
(
	input 	clk,
	input 	rst,
	
	input          	  i_start,
	input             i_load,
	input data_in_t   i_data,
	input op_select_t i_op,

	output data_t	o_reminder,
	output data_t  	o_result,
	output			o_ready,
	output         	o_load_x,
	output         	o_load_y,
	output         	o_error
);

st_mdr  wires;

control 				CTRL
(
	.clk         	(clk),
	.rst         	(rst),

	.i_start 		(i_start),
	.i_load      	(i_load),
	.i_error     	(wires.error),
	.i_done     	(wires.done),
	
	.o_clean     	(wires.clean),
	.o_load_x    	(o_load_x),
	.o_load_y    	(o_load_y),
	.o_save_x    	(wires.save_x),
	.o_save_y    	(wires.save_y),
	.o_veri      	(wires.veri),
	.o_error		(o_error),
	.o_enable    	(wires.enable),
	.o_init      	(wires.init),
	.o_ready     	(o_ready)

);

pipo 					PIPO_X
(
	.clk    		(clk),
	.rst    		(rst),

	.i_ena  		(wires.save_x),
	.i_data 		(i_data),

	.o_data 		(wires.data_x)
);

pipo 					PIPO_Y
(
	.clk    		(clk),
	.rst    		(rst),

	.i_ena  		(wires.save_y),
	.i_data 		(i_data),

	.o_data 		(wires.data_y)
);

verification		VERIFICATION
(
	.i_enable		(wires.veri),
	.i_dataX		(wires.data_x),
	.i_dataY		(wires.data_y),
	.i_op			(i_op),
	
	.o_error		(wires.error)
);	

core 					CORE
(
	.clk 			(clk),
	.rst			(rst),

	.i_enable		(wires.enable),
	.i_op			(i_op),
	.i_init			(wires.init),
	.i_clean		(wires.clean),
	.i_dataX		(wires.data_x),
	.i_dataY		(wires.data_y),
	
	.o_done			(wires.done),
	.o_result		(o_result),
	.o_remainder	(o_remainder)
);

endmodule // MDR_SV
`endif