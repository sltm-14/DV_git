`ifndef PIPO_SV
    `define PIPO_SV

module pipo 
import pkg_system_mdr::*;
(
	input					clk,
	input					rst,
	input        		i_ena,
	input  data_in_t	i_data,

	output data_in_t 	o_data
);

data_in_t r_data;

always_ff@(posedge clk or negedge rst) begin: rgstr_pipo
    if(!rst)
        r_data  <= '0;
    else if (i_ena)
        r_data  <= i_data;
end:rgstr_pipo

assign o_data 	= r_data;

endmodule
`endif