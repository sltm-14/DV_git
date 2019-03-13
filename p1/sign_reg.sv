/*-----------------------------------------------
* MODULE: 	  sign_reg.sv
* DESCRITION: Holds the value of the sign
* INPUTS: 	  clock, reset, signal load and values
* OUTPUTS:    Values
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module sign_reg
(
	/*Inputs*/
	input 	i_clk,
	input 	i_rst,
	input 	i_load,
	input 	i_val1,
	input 	i_val2,

	/*Outputs*/
	output 	o_val1,
	output 	o_val2
);

/*Registers to save the sign*/
logic r_val1; 
logic r_val2; 

always_ff @(posedge i_clk or negedge i_rst) begin 
	if(~i_rst) begin	/*Registers begins with zero*/
		r_val1 <= 0;
		r_val2 <= 0;
	end 
	else if(i_load)begin		/*The signs are loaded*/
		r_val1 <= i_val1;
		r_val2 <= i_val2;
	end
	else begin
		r_val1 <= r_val1;		/*Holds the sign value*/
		r_val2 <= r_val2;
	end
end

assign o_val1 = r_val1;
assign o_val2 = r_val2;

endmodule
