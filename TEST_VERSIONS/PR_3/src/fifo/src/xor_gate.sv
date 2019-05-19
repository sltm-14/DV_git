`ifndef XOR_GATE_SV
    `define XOR_GATE_SV

module xor_gate(
	input val_b_i,
	input val_a_i,

	output val_o
);

assign val_o = val_b_i ^ val_a_i;

endmodule
`endif