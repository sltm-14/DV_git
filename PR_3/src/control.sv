`ifndef CONTROL_SV
    `define CONTROL_SV

module control
import mxv_pkg::*;
(
	input clk_wr,
	input clk_rd,
	input rst,

	input data_uart_t data,


);


    typedef enum logic [3:0] {IDLE, SIZE, START, MATRIX, 
                              FIFO_0, FIFO_1, FIFO_2, FIFO_3
                              FIFO_4, FIFO_5, FIFO_6, FIFO_7, } state_ctrl_t;




endmodule
`endif