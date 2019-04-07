
`ifndef MDR_SV
    `define MDR_SV

module mdr
import pkg_system_mdr::*;
(
	input 		 clk,
	input  		 rst
/*	input 		 i_load,
	input 		 i_op,
	input 		 i_start,
	input data_t i_data,
	
	output data_t o_result,
	output 		  o_ready,
	output 		  o_loadX,
	output 		  o_loadY,
	output 		  o_error,
	output data_t o_reaminder*/
);

mdr_if	top_itf();

control CONTROL(
	.clk				(clk),
	.rst				(rst),

	.control_if		(top_itf.control)
);

pipo PIPO_X(
	.clk				(clk),
	.rst				(rst),

	.pipo_if			(top_itf.pipo_X)
);

pipo PIPO_Y(
	.clk				(clk),
	.rst				(rst),
	
	.pipo_if			(top_itf.pipo_Y)
);


validation VALIDATION(
	.val 			()
//	.clk			(clk),
//	.rst			(rst),

	.validation_if	(top_itf.validation)
);

core MDR(
	.clk				(clk),
	.rst				(rst),

	.core_if			(top_itf.core)
);
	

endmodule

`endif
