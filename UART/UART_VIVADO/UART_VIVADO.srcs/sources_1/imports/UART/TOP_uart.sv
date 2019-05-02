
module TOP_uart #( parameter BAUDRATE = (125000000/115200))(
    input wire clk, 
    input wire rstn,        
    input wire rx,          
         
    output wire tx
);


wire       rcv;
wire       ready;
wire [7:0] data;


uart_rx #(.BAUDRATE(BAUDRATE))  RX0 (
   .clk(clk),
   .rst(rstn),
   .rx(rx),
   .rcv(rcv),
   .data(data)
);

uart_tx #(.BAUDRATE(BAUDRATE))
  TX0 ( .clk(clk),
         .rst(rstn),
         .start(rcv),
         .data(data),
         .tx(tx),
         .ready(ready)
       );

endmodule