`ifndef SIPO_SV
    `define SIPO_SV 

module sipo 
import mxv_pkg::*;
(
	input    clk,
	input    rst,

	input                  enb,
	input  data_hex_t      inp,

	output data_hex_sipo_t out
);

data_hex_sipo_t   rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= {'0,'0,'0,'0,'0,'0,'0,'0,'0,'0,'0,'0,'0,'0};
    else if (enb)
        rgstr_r  <= {rgstr_r[SIPO_REG-2],rgstr_r[SIPO_REG-3],rgstr_r[SIPO_REG-4],rgstr_r[SIPO_REG-5],rgstr_r[SIPO_REG-6],rgstr_r[SIPO_REG-7],rgstr_r[SIPO_REG-8],rgstr_r[SIPO_REG-9],rgstr_r[SIPO_REG-10],rgstr_r[SIPO_REG-11],rgstr_r[SIPO_REG-12],rgstr_r[SIPO_REG-13],rgstr_r[SIPO_REG-14],inp};
		  
end:rgstr_label

assign out  = rgstr_r;

endmodule
`endif