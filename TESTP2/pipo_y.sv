`ifndef PIPO_SV
    `define PIPO_SV
	 
module pipo 
import pkg_system_mdr::*;
(
	input   		clk,
	input   		rst,
	input 			i_data,
	
	if_mdr.pipo		pipo_if
);

data_t	r_reg;

always_ff@(posedge clk or negedge rst) begin: pipo_label
    if(!rst)
        r_reg  <= '0;
    else if (pipo_if.i_enb)
        r_reg  <= pipo_if.w_data;
end:pipo_label

assign pipo_if.o_out  = r_reg;

endmodule

`endif