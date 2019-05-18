 /*-----------------------------------------------
* MODULE: 	  shift_left_quotient.sv
* DESCRITION: Shift to the left the quotient
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       01 / 05 / 19
* ----------------------------------------------*/
`ifndef SHIFT_LEFT_QUOTIENT_SV
    `define SHIFT_LEFT_QUOTIENT_SV

module shift_left_quotient 
import pkg_system_mdr::*;
#(	parameter SHIFT = 1	,
	parameter SDW   = 32  )
 (
	input 						clk,
	input 						rst,
	input logic [SDW-1:0]	i_val,
	input 			        	i_enable,

	output data_t 	       	 o_val
);


always_ff @(posedge clk or negedge rst) begin
	if(~rst) 
		o_val		<=	'0;
	
	else if (i_enable)
		o_val 	<= i_val << SHIFT;

	else
		o_val 	<= '0;

end

endmodule
`endif