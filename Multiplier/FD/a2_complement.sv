module complement_a2 #(
	parameter DW = 32
	)(
	input  [DW-1:0] i_Val, 

	output [DW-1:0] o_Val,
	output       	o_Signo
	);

	/*El valor del septimo bit indica si el signo es positivo o negativo, 
	**en caso de ser positivo se hace complemento A2
	**de lo contrario el valor continua igual */

	assign o_Val   = ( i_Val[DW-1] ) ? ( (~i_Val) + 1'b1 ) : i_Val; 
	assign o_Signo = ( i_Val[DW-1] ) ? 1'b1 : 1'b0;

endmodule