`ifndef MULTIPLIER_SV
    `define MULTIPLIER_SV
	 
module multiplier
import system_mdr_pkg::*;
(
	input clk,
	input reset,
	input i_enable,
	input i_dataX,
	input i_dataY,
	
	output data_t	o_product
);
	
endmodule
		
`endif