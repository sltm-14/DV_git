module FullAdder#(
	parameter DW = 4
	)(
	input  [DW-1:0] i_valA,
	input  [DW-1:0] i_valB,
	input			i_carry,

	output [DW-1:0] o_sum,
	output  	  	o_carry
	);

	logic [DW:0] r_sum;

	assign r_sum 	= i_valA + i_valB + i_carry;
	
	assign o_sum	= r_sum[DW-1:0];
	assign o_carry	= r_sum[DW];

endmodule