`ifndef COMPARISON_SV
   `define COMPARISON_SV

module comparison
import mxv_pkg::*;
(
	input count_t val_a,
	input count_t val_b,

	output logic match
);

assign match = (val_a == val_b)? 1:0;

endmodule
`endif  