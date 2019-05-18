 /*-----------------------------------------------
* MODULE: 	  root_op_calc.sv
* DESCRITION: Choose the operation to the ALU
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       01 / 05 / 19
* ----------------------------------------------*/
`ifndef ROOT_OP_CALC_SV
    `define ROOT_OP_CALC_SV

module root_op_calc
import pkg_system_mdr::*;
(
	input   				clk,
	input   				rst,
	input             i_alu_msb,
	input             i_init,
	input             i_enable,
	input           	i_msb,

	output data_t 		o_or_q,
	output data_t 		o_or_alu,
	output alu_op_t 	o_op_val
);


always_ff@(posedge clk or negedge rst) begin
	if(~rst)
		o_or_q 		<= 	'0;
	else if (i_enable) begin
		if(i_msb)begin
			o_or_q 	<=		{(DW2){1'b0}};
		end
		else begin
			o_or_q 	<= 	{{(DW2-1){1'b0}}, 1'b1};
		end
	end
	else
			o_or_q	<= 	{(DW2){1'b0}};
end

always_comb begin
	
	if(i_alu_msb)begin
		o_op_val 	=	ADD;
		o_or_alu 	=	3;
	end
	else begin
		o_op_val 	=	SUBS;
		o_or_alu 	=	1;
	end
	
end

endmodule 
`endif