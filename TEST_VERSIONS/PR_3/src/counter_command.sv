 `ifndef COUNTER_COMMAND_SV
    `define COUNTER_COMMAND_SV

module counter_command 
import mxv_pkg::*;
(
	input clk,
	input rst,

	input i_ena,
	input i_clear,

	output logic  o_ovf,
	output count_t o_count
);

	count_t r_count;

	always_ff@(posedge clk,negedge rst) begin
		if (!rst)begin
		 	r_count <= '0;
			o_ovf   <= 0;
		end
		else if (i_clear)
			r_count <= 0;
		else if (i_ena )begin
			if (r_count == 2) begin
				r_count <= '0;
				o_ovf   <=  1;
			end
			else begin
				r_count <= r_count + 1;
				o_ovf   <= 0;
			end
		end
		else begin
			r_count <= r_count;
			o_ovf   <=  0;
		end
	end


	assign o_count = r_count;

endmodule
`endif  