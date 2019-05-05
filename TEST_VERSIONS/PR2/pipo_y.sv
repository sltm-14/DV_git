`ifndef PIPO_Y_SV
    `define PIPO_Y_SV
	 
module pipo_y 
import pkg_system_mdr::*;
(
	input   		clk,
	input   		rst,
	
	if_mdr.pipo_Y	pipo_if
);

data_t	r_reg;

always_ff@(posedge clk or negedge rst) begin
    if(!rst)
        r_reg  <= '0;
    else if (pipo_if.w_loadY)
        r_reg  <= pipo_if.w_in_val;
end

assign pipo_if.w_data_Y  = r_reg;

endmodule
`endif