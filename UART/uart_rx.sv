`ifndef UART_RX_SV
    `define UART_RX_SV

module uart_rx 
import pkg_uart::*;
#( 
    parameter BAUDRATE = (125000000/115200)
)(
         input        clk,         
         input        rst, 

         input        i_rx,          
         
         output       o_rcv,         
         output [7:0] o_data   
);

wire clk_baud;

st_uart_rx wires;
/*
reg bauden;  
reg clear;   
reg load;   
*/

register REG_RX(
    .clk(clk),
    .rst(rst),

    .i_val(i_rx),

    .o_val(wires.rx)
);

/*reg rx_r;

always @(posedge clk)
  rx_r <= rx;
*/

baudgen_rx #(BAUDRATE) BAUD_RX (
    .rstn(rst),
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

/*reg [3:0] bitc;

always @(posedge clk)
  if (clear)
    bitc <= 4'd0;
  else if (clk_baud )
    bitc <= bitc + 1;*/

sipo SIPO_DATA(
    .clk(clk),
    .rst(rst),

    .i_ena(wires.clk_baud),
    .i_val(wires.rx),

    .o_val(wires.rcv_data)
);

/*
reg [9:0] raw_data;

always @(posedge clk)
  if (clk_baud == 1)
    raw_data <= {rx_r, raw_data[9:1]};*/

register_en REG_DATA(
    .clk(clk),
    .rst(rst),

    .i_val(wires.rcv_data[8:1]),
    .i_ena(wires.load),

    .o_val(o_data)
);



/*always @(posedge clk)
  if (rstn == 0)
    data <= 0;
  else if (load)
    data <= raw_data[8:1];*/

rx_control CONTROL(
    .clk(clk),    
    .rst(rst), 
     
    .i_rx(wires.rx), 
    .i_count(wires.count),
      
    .o_bauden(wires.bauden),
    .o_clear(wires.clear),
    .o_load(wires.load),
    .o_rcv(wires.rcv)
);

/*
localparam IDLE = 2'd0;  
localparam RECV = 2'd1;  
localparam LOAD = 2'd2;  
localparam DAV = 2'd3;   


reg [1:0] state;
reg [1:0] next_state;


always @(posedge clk)
  if (!rstn)
    state <= IDLE;
  else
    state <= next_state;


always @(*) begin

  next_state = state;      
  bauden = 0;
  clear = 0;
  load = 0;

  case(state)

   IDLE: begin
      clear = 1;
      rcv = 0;
      if (rx_r == 0)
        next_state = RECV;
    end

    RECV: begin
      bauden = 1;
      rcv = 0;
      if (bitc == 4'd10)
        next_state = LOAD;
    end

    
    LOAD: begin
      load = 1;
      rcv = 0;
      next_state = DAV;
    end

    
    DAV: begin
      rcv = 1;
      next_state = IDLE;
    end

    default:
      rcv = 0;

  endcase

end*/

endmodule
`endif