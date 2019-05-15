
module uart_tx
import pkg_uart::*;
#(
   parameter BAUDRATE = (125000000/115200)  //-- Default baudrate
)(
    input  clk,        
    input  rst,   

    input         start,      
    input  data_t data, 
         
    output        tx,         
    output        ready      
);

st_uart_tx wires;

baudgen_tx #( .BAUDRATE(BAUDRATE)) BAUDGEN_TX (
  .rst(rst),
  .clk(clk),

  .clk_ena(wires.bauden),

  .clk_out(wires.clk_baud)
);


register_en_dw_8 REG_DATA(
  .clk (clk),
  .rst (rst),

  .i_val  (data),
  .i_ena  (wires.start),

  .o_val  (wires.rcv_data)
);

parity_bit_gen PARBIT_GEN(
    .data(data),

    .parity_bit(wires.par_bit)
);

shifter SHIFTER(
  .clk (clk),
  .rst (rst),

  .i_data  ({wires.par_bit,wires.rcv_data}),
  .i_load  (wires.load),
  .i_ena   (wires.clk_baud),

  .o_shift_lsb (wires.shifter)
);


counter COUNT(
  .clk(clk),
  .rst(rst),

  .i_clear (wires.load),
  .i_ena   (wires.clk_baud),

  .o_count(wires.count)
);


register REG_RX(
  .clk(clk),
  .rst(rst),
 
  .i_val(wires.shifter[0]),

  .o_val(tx)
);



control_tx CONTROL(
  .clk(clk),    
  .rst(rst), 

  .i_start (start), 
  .i_count (wires.count),
  
  .o_bauden (wires.bauden),
  .o_load   (wires.load),
  .o_ready  (ready),
  .o_start  (wires.start)
);


endmodule