`ifndef DATA_SV
    `define DATA_SV

module data
import pkg_system_mdr::*;(
	input   		clk,
	input   		rst,
	
	if_mdr.data		data_if

	);


st_data	r_data;

always_ff@(posedge clk, negedge rst) begin: data
	if(!rst)					/* Resets the value */
		r_data.data_val  <= '0;

	else begin
		case (op) 
			MULT: begin
				if(data_if.w_enable)
					r_data.data_val = data_if.w_dataIn_Y;
				else
					r_data.data_val = r_data.data_val;
			end

			DIV: begin
				if(data_if.w_enable)
					r_data.data_val = data_if.w_dataIn_Y;
				else
					r_data.data_val = r_data.data_val;
			end

			ROOT: begin

			end

			default: begin
				r_data.data_val  <= '0;
			end

		endcase // op

	end
end:data

/* Assign data to output value */
assign data_if.w_data_Y = r_data.data_val;
	

endmodule