`ifndef POINTER_RD_SV
    `define POINTER_RD_SV

module pointer_rd
import fifo_pkg::*;
(
	input clk,

	input         pop,
	input         empty_flag,

	output logic  ena_rd,
	output addr_t addr_rd,
	output logic  led_error
);

addr_t tail_r = W_DEPTH - 1'b1;

always_ff @(posedge clk ) begin 

	if (empty_flag) begin
		led_error <= 1'b1;
	end
	else if(pop) begin 
		led_error <= 1'b0;
		ena_rd    <= 1'b1;
		tail_r    <= (tail_r + 1'b1) % W_DEPTH;
	end

	else begin
		ena_rd    <= 1'b0;
		led_error <= 1'b0;	
	end
end

assign addr_rd = tail_r;

endmodule
`endif