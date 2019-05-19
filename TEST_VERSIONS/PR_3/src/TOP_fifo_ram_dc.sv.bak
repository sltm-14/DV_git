`ifndef TOP_POINTER_RD_SV
    `define TOP_POINTER_RD_SV

module TOP_fifo_ram_dc
import fifo_pkg::*;
(	
	input clk_wr,
	input clk_rd,
	input rst,

	input data_t data_i,
	input logic  push,
	input logic  pop,

	output data_t data_o,
	output logic empty,
	output logic full
);

    fifo_st wires;


pointer_wr POINTER_WR(
	.clk       (clk_wr),

	.push      (push),
	.full_flag (full),

	.ena_wr    (wires.ena_poin_ram_wr),
	.addr_wr   (wires.addr_poin_ram_wr), 
	.led_error ()
);

pointer_rd POINTER_RD(
	.clk        (clk_rd),

	.pop        (pop),
	.empty_flag (empty),

	.ena_rd     (wires.ena_poin_ram_rd),
	.addr_rd    (wires.addr_poin_ram_rd), 
	.led_error  ()
);

ram_dc RAM(
	.clk_wr  (clk_wr),   
	.clk_rd  (clk_rd),   

	.en_wr   (wires.ena_poin_ram_wr),    
	.en_rd   (wires.ena_poin_ram_rd),    
	.data_wr (data_i),  
	.addr_wr (wires.addr_poin_ram_wr),  
	.addr_dr (wires.addr_poin_ram_rd),  

	.data_rd (data_o)  
);

addrs_synch SYNCH_FULL(
	.clk    (clk_wr),
	.rst    (rst),

	.addr_1 (wires.addr_poin_ram_rd ), 
	.addr_2 (wires.addr_poin_ram_wr + 1), 

	.flag   (full)
);

addrs_synch SYNCH_EMPTY(
	.clk    (clk_rd),
	.rst    (rst),

	.addr_1 (wires.addr_poin_ram_wr), 
	.addr_2 (wires.addr_poin_ram_rd),

	.flag   (empty)
);


endmodule
`endif