`ifndef MUX_2_1_SV
    `define MUX_2_1_SV

module mux_2_1
import mxv_pkg::*;
(
	input   result_t i_bus_a,   
	input   result_t i_bus_b,
	input   sltr_2_t  i_sltr,     

	output  result_t  o_bus      
);

	assign o_bus = i_sltr? i_bus_a:i_bus_b;

endmodule
`endif