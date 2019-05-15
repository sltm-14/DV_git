`ifndef GRAY2BIN_SV
    `define GRAY2BIN_SV

module gray2bin
import fifo_pkg::*;
(
    input  addr_t gray,

    output addr_t bin
);

    assign bin[W_ADDR-1] = gray[W_ADDR-1];

    generate 
        genvar i;
        for ( i = ( W_ADDR - 2 ) ; i >= 0 ; i = ( i - 1 ))begin: generate_gray2bin
            xor_gate XOR(
                .val_b_i(gray[i]),
                .val_a_i(bin[i+1]),

                .val_o(bin[i])
            );
        end: generate_gray2bin
    endgenerate

endmodule
`endif