module multiplexer
 #(
	PARAMETER SLC = 2,
	PARAMETER DW  = 4
	)
	(
	input 				clk,
	input 				rst,
	input  [SLC-1:0]	i_slc,
	input  [DW-1:0]     i_data,

	output 			 	o_out
	);

	assign o_out = i_data[i_slc];

endmodule
