`ifndef POINTER_WR_SV
    `define POINTER_WR_SV

module pointer_wr
import fifo_pkg::*;
(
	input clk,

	input         push,
	input         full_flag,

	output logic  ena_wr,
	output addr_t addr_wr,
	output logic  led_error
);

addr_t head_r = W_DEPTH - 1;

always_ff @(posedge clk) begin 

	if (full_flag) begin
		led_error <= 1;
	end
	else if(push) begin 
		led_error <= 0;
		ena_wr    <= 1;
		head_r    <= (head_r + 1'b1) % W_DEPTH;
	end

	else begin
		ena_wr    <= 0;
		led_error <= 0;	
	end
	
end

assign addr_wr = head_r;

endmodule
`endif