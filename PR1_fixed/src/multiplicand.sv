/*-----------------------------------------------
* MODULE: 	  multiplicand.sv
* DESCRITION: Shift left the multiplicand to get 
					the new value 
* INPUTS: 	  i_clk, i_rst, i_load, i_data, i_stop
* OUTPUTS:    o_data
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module multiplicand 
import pkg_mult::*;
(      
	input    		i_clk,				/* Clk */
	input    		i_rst,				/* Rst */
	input				i_load,				/* Load */
	input val_t		i_data,				/* Data */
	input				i_stop,

	output multiplicand_t o_data		/* Data after shift */
);

multiplicand_t	r_multiplicand;

always_ff@(posedge i_clk, negedge i_rst) begin: shift_left
	if(!i_rst)					/* Resets the value */
		r_multiplicand  <= '0;
	else if (i_load)						/* Loads new value */
		r_multiplicand  <= i_data;
	else if (i_stop)						/* Shifts */
		r_multiplicand  <= r_multiplicand;
	else
		r_multiplicand  <= r_multiplicand << 1'b1;
end:shift_left

/* Assign data to output value */
assign o_data = r_multiplicand;
	
endmodule