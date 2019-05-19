`ifndef BIN2GRAY_SV
    `define BIN2GRAY_SV

module bin2gray
import fifo_pkg::*;
(
	input  addr_t bin,

	output addr_t gray
);

    generate 
        genvar i;
        for ( i = '0 ; i <= ( W_ADDR - 2 ) ; i = ( i + 1 ))begin: generate_bin2gray
            xor_gate XOR(
				.val_b_i(bin[i]),
				.val_a_i(bin[i+1]),

				.val_o(gray[i])
			);
        end: generate_bin2gray
    endgenerate

    assign gray[W_ADDR-1] = bin[W_ADDR-1];


endmodule
`endif