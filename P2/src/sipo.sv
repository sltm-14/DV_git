module sipo 
import pkg_system_mdr::*;
#(
	parameter DW = 4
) 
(
	input               	clk,
	input               	rst,
	input               	enb,
	input               	inp,
	
	output  data_t   		o_data
);

data_t     rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb)
        rgstr_r  <= {rgstr_r[DW-2:0], inp};
end:rgstr_label

assign out  = rgstr_r;

endmodule
