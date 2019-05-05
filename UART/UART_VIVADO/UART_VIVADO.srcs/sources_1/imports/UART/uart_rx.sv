`ifndef UART_RX_SV
    `define UART_RX_SV

module uart_rx 
import pkg_uart::*;
#( parameter BAUDRATE = (125000000/115200))(
         input wire       clk,         
         input wire       rst,        
         input wire       rx,          
         
         output reg       rcv,         
         output reg [7:0] data   
);

st_uart_rx wires;


register #(1) REG_RX(
    .clk(clk),
    .rst(rst),

    .i_val(rx),

    .o_val(wires.rx)
);


baudgen_rx #(BAUDRATE) baudgen0 (
    .rst(rst),
    .clk(clk),
    .clk_ena(wires.bauden),
    .clk_out(wires.clk_baud)
  );




counter COUNT(
    .clk(clk),
    .rst(rst),

    .i_clear(wires.clear),
    .i_ena(wires.clk_baud),

    .o_count(wires.count)
);


sipo #(10) SIPO_DATA(
    .clk(clk),
    .rst(rst),

    .i_ena(wires.clk_baud),
    .i_val(wires.rx),

    .o_val(wires.rcv_data)
);


register_en #(8)  REG_DATA(
    .clk(clk),
    .rst(rst),

    .i_val(wires.rcv_data[8:1]),
    .i_ena(wires.load),

    .o_val(data)
);


control_rx CONTROL(
    .clk(clk),    
    .rst(rst), 
     
    .i_rx(wires.rx), 
    .i_count(wires.count),
      
    .o_bauden(wires.bauden),
    .o_clear(wires.clear),
    .o_load(wires.load),
    .o_rcv(rcv)
);



endmodule
`endif