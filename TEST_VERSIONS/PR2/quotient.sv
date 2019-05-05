`ifndef QUOTIENT_SV
    `define QUOTIENT_SV

module quotient
import pkg_system_mdr::*;(
	input   		clk,
	input   		rst,
	
	if_mdr.quotient	quo_if

	);

	st_quotient	r_quo;

/* 	input w_op,
	input w_r_mb,
	input w_mux_quo,
	input w_ovf,
	input w_enable,

	output w_quo_val */

/* 	if (R >= 0)
	Q = (Q << 1) | 1;
	else
	Q = (Q << 1) | 0; */ 

	always_ff@(posedge clk, negedge rst) begin
	if(!rst)					/* Resets the value */
		r_quo.quo_val  = '0;

	else if(quo_if.w_init)begin
		r_quo.quo_val = quo_if.w_mux_quo;
	end

	else if (quo_if.w_enable)begin
		case (quo_if.w_op) 
			MULT: begin
				r_quo.quo_val  = r_quo.quo_val;
			end

			DIV: begin
				r_quo.quo_val  = r_quo.quo_val;
			end

			ROOT: begin
				if (quo_if.w_r_mb)
					r_quo.quo_val = (r_quo.quo_val << 1) | 0;
				else 
					r_quo.quo_val = (r_quo.quo_val << 1) | 1;

			end

			default: begin
				r_quo.quo_val  = '0;
			end

		endcase // op
	end
	else 
		r_quo.quo_val  = '0;
end

endmodule
`endif