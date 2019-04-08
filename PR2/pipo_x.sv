`ifndef PIPO_X_SV
    `define PIPO_X_SV
	 
module pipo_x 
import pkg_system_mdr::*;
(
	input   		clk,
	input   		rst,
	
	if_mdr.pipo_X	pipo_ifx
);

data_t	r_reg;

always_ff@(posedge clk or negedge rst) begin
    if(!rst)
        r_reg  <= '0;
    else if (pipo_ifx.w_loadX)
        r_reg  <= pipo_ifx.w_in_val;
end

assign pipo_ifx.w_rem_X  = r_reg;

endmodule
`endif