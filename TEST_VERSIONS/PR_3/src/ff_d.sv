`ifndef FF_D_SV
    `define FF_D_SV

module ff_d 
import fifo_pkg::*;
(
	input  clk,
	input  rst,

	input  addr_t in,

	output addr_t out
);

addr_t ff_d_r;

always_ff@(posedge clk, negedge rst) begin
    if(!rst)
        ff_d_r  <= '0;
    else 
        ff_d_r  <= in;
end

assign out  = ff_d_r;

endmodule
`endif