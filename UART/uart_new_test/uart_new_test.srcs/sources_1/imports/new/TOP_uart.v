
module echo #( parameter BAUDRATE = (125000000/115200))(
    input wire clk,         
    input wire rx,          
         
    output wire tx
);


wire       rcv;
wire       ready;
wire [7:0] data;

reg rstn = 0;


always @(posedge clk)
  rstn <= 1;


uart_rx #(.BAUDRATE(BAUDRATE))
  RX0 (.clk(clk),
       .rstn(rstn),
       .rx(rx),
       .rcv(rcv),
       .data(data)
      );

uart_tx #(.BAUDRATE(BAUDRATE))
  TX0 ( .clk(clk),
         .rstn(rstn),
         .start(rcv),
         .data(data),
         .tx(tx),
         .ready(ready)
       );

endmodule