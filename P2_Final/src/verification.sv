`ifndef VERIFICATION_SV
    `define VERIFICATION_SV

module verification
import pkg_system_mdr::*; 
(
	input 					i_enable,
	input data_in_t		i_dataX,
	input data_in_t		i_dataY,
	input op_select_t		i_op,
	
	output 					o_error
);

logic r_error;

always_comb begin
	if(i_enable) begin
		case(i_op)
			MULT: begin
				if((i_dataX == 4'hFFFF) & (i_dataY == 4'hFFFF))
					r_error = 1'b1;
				else
					r_error = 1'b0;
			end
			
			DIV: begin
				if(i_dataY == '0)
					r_error = 1'b1;
				else
					r_error = 1'b0;
			end
			
			ROOT: begin
				if(i_dataX[16-1] == 1'b1)
					r_error = 1'b1;
				else
					r_error = 1'b0;
			
			end
			
			NON:
				r_error = 1'b1;
			
			default:
				r_error = 1'b0;
		endcase
	end
	else
		r_error = 1'b0;
end

assign o_error = r_error;

endmodule
`endif