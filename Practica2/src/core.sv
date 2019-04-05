
`ifndef CORE_SV
    `define CORE_SV
module core
import system_mdr_pkg::*;
(
	input 			clk,
	input 			rst,
	mddr_if.core	core_if
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