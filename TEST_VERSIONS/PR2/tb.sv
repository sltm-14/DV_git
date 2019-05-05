module tb
  import pkg_system_mdr::*;
  ();
  logic clk;
  always #1 clk = ~clk;
  logic rst;
 
  if_mdr   if0 ();
  mdr   d0  (
    .clk(clk),
    .rst(rst),
    .mdr_itf(if0)
    );  
 
  // Let the stimulus run for 20 clocks and stop
  initial begin
    clk <= 0;
    rst <= 0; #3;
    rst <= 1; #2;

    if0.w_start  <= 1;   #2;
    if0.w_start  <= 0;
    if0.w_op     <= MULT;
    if0.w_in_val <= -3;  #8;
    if0.w_load   <= 1;   #2;
    if0.w_load   <= 0;   #2;
    if0.w_in_val <= 2;   #8;
    if0.w_load   <= 1;   #2;
    if0.w_load   <= 0;   #2;
  
  end
endmodule