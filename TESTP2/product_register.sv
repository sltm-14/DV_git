`ifndef PRODUCT_REGISTER_SV
    `define PRODUCT_REGISTER_SV
module product_register
import pkg_system_mdr::*;
(
	input clock,
	input reset,
	input load,
	input ready,
	input data_t data,
	
	output data_t lsb,
	output data_t product
);

data_t r_product;

always_ff@(posedge clock, negedge reset) begin



end

endmodule
`endif