`ifndef PRODUCT_REGISTER_SV
    `define PRODUCT_REGISTER_SV
module product_register
import system_mdr_pkg::*;
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
	if(!reset)
		r_product => '0;
	else if(load)
		r_product => data;
	else if(ready)
		r_product => 


end

endmodule
`endif