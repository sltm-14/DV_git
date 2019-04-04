
`ifndef DIVISION_SV
    `define DIVISION_SV
module core
import system_mdr_pkg::*;
(
	input clk,
	input rst,
	input data_t i_dataX,
	input data_t i_dataY,
	input enb_t i_enable,
	
	output o_done,
	output data_t o_result,
	output data_t o_remainder
);

	multiplier MULT
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		.i_dataY(),
		
		.o_product()
	);
	
	division DIV
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		.i_dataY(),
		
		.o_quotation(),
		.o_remainder()
	);
	
	root ROOT
	(
		.clk(),
		.rst(),
		.i_enable(),
		.i_dataX(),
		
		.o_quotation(),
		.o_remainder()
	);
	
endmodule
`endif