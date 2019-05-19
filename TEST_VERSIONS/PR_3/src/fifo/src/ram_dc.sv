

`ifndef RAM_DC_SV
    `define RAM_DC_SV

module ram_dc
import fifo_pkg::*;
(
	input         clk_wr,   /* Core clock a */
	input         clk_rd,   /* Core clock b */

	input         en_wr,    /* Write enable */
	input         en_rd,    /* Write enable */
	input  data_t data_wr,  /* data to be stored */
	input  addr_t addr_wr,  /* Read write address */
	input  addr_t addr_dr,  /* Read write address */

	output data_t data_rd   /* read data from memory */
);

logic [W_DATA-1:0]  ram [W_DEPTH-1:0];

always_ff@( posedge clk_wr ) begin
	if( en_wr )begin
	    ram[addr_wr] <= data_wr;
	end
end

always_ff@( posedge clk_rd ) begin
	if( en_rd )begin
	    data_rd <= ram[addr_dr];
    end
end

endmodule
`endif
