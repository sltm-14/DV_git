`ifndef CONTROL_RX_SV
    `define CONTROL_RX_SV

module control_rx 
import pkg_uart::*;
(
  input clk,    
  input rst, 

  input i_rx, 
  input count_t i_count,
  
  output o_bauden,
  output o_clear,
  output o_load,
  output o_rcv
);


logic bauden = '0;  
logic clear  = '0;   
logic load   = '0;   
logic rcv = '0;

/*localparam IDLE = 2'd0;  
localparam RECV = 2'd1;  
localparam LOAD = 2'd2;  
localparam READY  = 2'd3;   */

state_rx_t state = IDLE;

/*logic [1:0] next_state = state; */




/*always @(posedge clk, posedge rstn)
  if (!rstn)
    state <= IDLE;
  else
    state <= next_state;*/


always @(posedge clk, posedge rst) begin

    if (!rst)
        state <= IDLE;
    else

    /*  next_state = state;      
      bauden     = 0;
      clear      = 0;
      load    = 0;*/

    case(state)

       IDLE: begin
       /*   clear = 1;
          rcv   = 0;*/
          if (i_rx == 0)
            state <= RECV;
        end

        RECV: begin
    /*      bauden = 1;
          rcv    = 0;*/
          if (i_count == 4'd10)
            state <= LOAD;
        end

        
        LOAD: begin
    /*      load = 1;
          rcv  = 0;*/
          state <= READY;
        end

        
        READY: begin
      /*    rcv        = 1;*/
          state <= IDLE;
        end

        default: begin
          state <= IDLE;
    /*     rcv = 0;*/
        end 

    endcase

end

always @(*) begin
    case(state)

       IDLE: begin
          rcv    = 0;
          load   = 0;
          clear  = 1;
          bauden = 0;
        end

        RECV: begin
          rcv    = 0;
          load   = 0;
          clear  = 0;
          bauden = 1;
        end

        
        LOAD: begin
          rcv    = 0;
          load   = 1;
          clear  = 0;
          bauden = 0;
        end

        
        READY: begin
          rcv    = 1;
          load   = 0;
          clear  = 0;
          bauden = 0;
        end


        default: begin
          rcv    = 0;
          load   = 0;
          clear  = 0;
          bauden = 0;
        end 

    endcase
end

   assign o_bauden = bauden;
   assign o_clear  = clear;
   assign o_load   = load;
   assign o_rcv    = rcv;

endmodule
 `endif  