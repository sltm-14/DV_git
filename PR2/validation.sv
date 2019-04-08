
`ifndef VALIDATION_SV
    `define VALIDATION_SV
	 
module validation
import pkg_system_mdr::*;
(
	input		clk,
	input 		rst, 

	if_mdr.validation		validation_if
);

/* 	input 	w_veri,
	input 	w_data_X,
	input 	w_data_Y,
	input 	w_op,
	
	output 	w_error */

always @ (posedge clk, negedge rst)begin
	if(!rst)
		validation_if.w_error = '0;
	else if (validation_if.w_veri)begin
		case (validation_if.w_op) 
			MULT: begin
				if(validation_if.w_rem_X == '1 || validation_if.w_data_Y == '1 )
					validation_if.w_error =1'b1;
				else
					validation_if.w_error =1'b0;
			end

			DIV: begin
				if(validation_if.w_rem_X == '1 || validation_if.w_data_Y == '1 )
						validation_if.w_error =1'b1;
					else
						validation_if.w_error =1'b0;
			end

			ROOT: begin
				if(validation_if.w_rem_X == '1 || validation_if.w_data_Y == '1 )
					validation_if.w_error =1'b1;
				else
					validation_if.w_error =1'b0;
			end

			default: begin
				validation_if.w_error =1'b0;
			end

		endcase // op
	end
	else 
		validation_if.w_error =1'b0;

end



endmodule
`endif