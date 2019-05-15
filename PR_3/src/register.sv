`ifndef REGISTER_8_SV
    `define REGISTER_8_SV

module register_8 
import pkg_uart::*;
(
	input  clk,
	input  rst,

	input  data_uart_t i_val,

	output data_uart_t o_val
);


always_ff @(posedge clk, negedge rst) begin
	if(!rst) 
		o_val <= '0;

	else 
		o_val <= i_val;
end

endmodule
`endif