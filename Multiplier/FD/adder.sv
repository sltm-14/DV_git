module adder #(
	parameter DW=4
	)(
	input   [DW-1:0]    augend,
	input   [DW-1:0]    addend,
	output  [DW:0]      sum
	);

	assign sum    =   augend  + addend ;

endmodule
