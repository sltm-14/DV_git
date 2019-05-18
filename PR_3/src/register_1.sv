`ifndef REGISTER_1_SV
    `define REGISTER_1_SV

module register_1
import mxv_pkg::*;
(
	input  clk,
	input  rst,

	input  logic i_val,

	output logic o_val
);

reg val;

always_ff @(posedge clk, negedge rst) begin
	if(!rst) 
		val <= '0;

	else 
		val <= i_val;
end

always @(*)begin
	o_val = val;
end

endmodule
`endif