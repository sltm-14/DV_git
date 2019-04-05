`ifndef PIPO_SV
    `define PIPO_SV
	 
module pipo 
import system_mdr_pkg::*;
(
	input         	clk,
	input          rst,

	mdr_if.pipo	pipo_if
);

data_t	r_reg;

always_ff@(posedge clk or negedge rst) begin: pipo_label
    if(!rst)
        r_reg  <= '0;
    else if (pipo_if.i_enb)
        r_reg  <= pipo_if.i_data;
end:pipo_label

assign pipo_if.o_out  = r_reg;

endmodule

`endif