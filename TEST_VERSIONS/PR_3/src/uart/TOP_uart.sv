`ifndef TOP_UART_SV
    `define TOP_UART_SV

module TOP_uart 
import pkg_uart::*;
#( 
    parameter BAUDRATE = (125000000/115200)
)(
    input  clk, 
    input  rstn,    

    input         rx,          
    
    output        tx,
    output        error,
    output data_t data,
    output logic  rcv,
    output logic  clk_baud
    
);

st_uart_top wires;


uart_rx #(.BAUDRATE(BAUDRATE)) RX (
    .clk(clk),
    .rst(rstn),
    .rx(rx),
       
    .rcv(rcv),
    .data(data),
    .error(error)
);

uart_tx #(.BAUDRATE(BAUDRATE)) TX ( 
    .clk(clk),
    .rst(rstn),
    .start(rcv),
    .data(data),
    
    .tx(tx),
    .ready(wires.ready),
    .clk_baud(clk_baud)
);

endmodule
`endif  