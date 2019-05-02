module baudgen_tx #(
          parameter BAUDRATE = (125000000/115200)  //-- Default baudrate
)(
          input wire rstn,              //-- Reset (active low)
          input wire clk,               //-- System clock
          input wire clk_ena,           //-- Clock enable
          output wire clk_out           //-- Bitrate Clock output
);

//-- Number of bits needed for storing the baudrate divisor
localparam N = $clog2(BAUDRATE);

//-- Counter for implementing the divisor (it is a BAUDRATE module counter)
//-- (when BAUDRATE is reached, it start again from 0)
reg [N-1:0] divcounter = 0;

always @(posedge clk)

  if (!rstn)
    divcounter <= 0;

  else if (clk_ena)
    //-- Normal working: counting. When the maximum count is reached, it starts from 0
    divcounter <= (divcounter == BAUDRATE - 1) ? 0 : divcounter + 1;
  else
    //-- Counter fixed to its maximum value
    //-- When it is resumed it start from 0
    divcounter <= BAUDRATE - 1;

//-- The output is 1 when the counter is 0, if clk_ena is active
//-- It is 1 only for one system clock cycle
assign clk_out = (divcounter == 0) ? clk_ena : 0;


endmodule