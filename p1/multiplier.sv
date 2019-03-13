/*-----------------------------------------------
* MODULE: 	  multiplier.sv
* DESCRITION: gets the less significant bit of the multiplier
* INPUTS: 	  i_clk, i_rst, i_start, i_sw
* OUTPUTS:    o_leds, o_ready
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module multiplier 
import mult_pkg::*;
(
input          	i_clk,	/* Clk */
input       		i_rst,	/* Rst */
input 				i_load,	/* Load */
input  	data_t	i_data,	/* Data */

output          	o_done,
output   			o_lsb	/* Less Significant Bit */
);

multiplier_t	r_multiplier;

always_ff@(posedge i_clk, negedge i_rst) begin:shift_right
	if(!i_rst)	/* Resets value */
		r_multiplier  <= '0;
	else if (i_load)	/* Load new value */
		r_multiplier  <= i_data;
	else	/* Shifts value to righ */
		r_multiplier  <= r_multiplier >> 1'b1;
end:shift_right

/* Assigns less significant bit of multiplier to output */
assign o_lsb  = r_multiplier[0];
assign o_done = (r_multiplier == '0) ? 1'b1 : 1'b0;

endmodule