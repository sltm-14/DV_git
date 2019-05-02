`ifndef PKG_UART_SV
    `define PKG_UART_SV
	 
package pkg_uart;

localparam  DW  = 8;
localparam  DW1 = DW + 1;

typedef logic [3:0]     count_t;
typedef logic [DW1-1:0] rcv_data_t;
typedef logic [DW-1:0]  data_t;


typedef enum logic [1:0] {IDLE, RECV, LOAD, READY} state_t;	/* enum for states */
				 

typedef struct{
	logic       clk_baud;
	logic 		rx;
	count_t     count;
	logic       bauden;
	logic       clear;
	logic       laod;
	logic       rcv;
	rcv_data_t  rcv_data;
}st_uart_rx;



endpackage
`endif
