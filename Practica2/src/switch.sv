/*-----------------------------------------------
* MODULE: 	  	switch.sv
* DESCRIPTION: Switches such as inputs of data and
*					operation. The opcode for operation
*					is based on the next combinations:
*					- 00 None
*					- 01 Multiplication
*					- 10 Division
*					- 11 Square root
*					
* INPUTS: 	  clock, reset and switches
* OUTPUTS:    data and operation code
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       05 / 04 / 19
* ----------------------------------------------*/

`ifndef SWITCH_SV
    `define SWITCH_SV
	 
module switch
import system_mdr_pkg::*;

(
	input					clk,
	input					rst,
	
	mdr_if.switch		switch_if
);

switch_t r_switch;

always_ff@(posedge clk, negedge rst) begin: switch 
	if(!rst) begin
		/*Registers begins at zero*/
		r_switch.data 	<= '0;
		r_switch.op		<= '0;
	end
	else if(i_load) begin
		/*Assigns the data switch to the registers*/
		r_switch.data 	<= switch.i_sw[DW-1:0];
		r_switch.op		<=	switch.i_sw[SW-1:SW-2];
	end
	else begin
		/*Clear the registers*/
		r_switch.data 	<= '0;
		r_switch.op		<=	'0;
	end
end: switch 

/*Data assignments*/
assign switch_if.o_data 	= r_switch.data;
assign switch_if.o_op		= r_switch.op;

endmodule

`endif
