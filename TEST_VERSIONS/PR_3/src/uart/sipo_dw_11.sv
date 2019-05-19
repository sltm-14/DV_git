 `ifndef SIPO_SV
    `define SIPO_SV

module sipo_dw_11
import pkg_uart::*;
(
	input            clk,
	input            rst,

	input            i_ena,
	input            i_val,

	output  frame_t  o_val
);

	frame_t  r_rgstr;

	always_ff@(posedge clk, negedge rst) begin
	    if(!rst)
	        r_rgstr  <= '0;
	    else if (i_ena)
	        r_rgstr  <= {i_val, r_rgstr[FW-1:1]};
	end

	assign o_val  = r_rgstr;

endmodule
 `endif  