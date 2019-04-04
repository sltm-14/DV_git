
`ifndef MDR_SV
    `define MDR_SV

module mdr
import system_mdr_pkg::*;
(
	input clk,
	input rst,
	input i_load,
	input i_op,
	input i_start,
	input data_t i_data,
	
	output data_t o_result,
	output o_ready,
	output o_loadX,
	output o_loadY,
	output o_error
	output data_t o_reaminder
);

	pipo PIPO_DATA1
	(
		.clk(clk),
		.rst(rst),
		.i_enable(),
		.i_data(i_data),
		
		.o_out()
	);
	
	pipo PIPO_DATA2
	(
		.clk(clk),
		.rst(rst),
		.i_enb(),
		.i_data(i_data),
		
		.o_out()
	);
	
	control CONTROL
	(
		.clk(),
		.rst(),
		.i_load(),
		.i_op(),
		.i_start(),
		.i_done(),
		.i_error(),
		
		.o_error(),
		.o_ready(),
		.o_loadX(),
		.o_loadY(),
		.o_enable()
	);
	
	validation VALIDATION
	(
		.clk(),
		.rst(),
		.i_dataX(),
		.i_dataY(),
		
		.o_dataX(),
		.o_dataY()
	);
	
	core MDR
	(
		.clk(),
		.rst(),
		.i_dataX(),
		.i_dataY(),
		.i_enable(),
		
		.o_done(),
		.o_result(),
		.o_remainder()
	);
	

endmodule
`endif
