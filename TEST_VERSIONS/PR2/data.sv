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

	else if(data_if.w_init)begin
			r_data.data_val = data_if.w_data_val;
	end

	else if(data_if.w_enable) begin
		case (data_if.w_op) 
			MULT: begin
				r_data.data_val = r_data.data_val;
			end

			DIV: begin
				r_data.data_val = r_data.data_val;
			end

			ROOT: begin
				r_data.data_val = r_data.data_val >>  (data_if.w_counter + data_if.w_counter) & 3;
				// (D >> (i + i) & 3)
			end

			default: begin
				r_data.data_val  = r_data.data_val;
			end

		endcase // op
	end
	else
		r_data.data_val = r_data.data_val;
end:data

/* Assign data to output value */
assign data_if.w_val_data = r_data.data_val;
	

endmodule
`endif