
module tb_usr #(
    parameter DW  = 8
    )();

    logic           clk;
    logic           rst;
    logic           enb;
    logic [1:0]     selector;
    logic           i_serialLeft;
    logic           i_serialRight;
    logic [DW-1:0]  i_parallel;
    
    logic [DW-1:0]  out;


usr USR(
    .clock          (clk),
    .reset          (rst),
    .enb            (enb),
    .selector       (selector),
    .i_serialLeft   (i_serialLeft),
    .i_serialRight  (i_serialRight),
    .i_parallel     (i_parallel),
    
    .out(out)
);

initial begin

            clk             = 0;
            enb             = 0;

    #1      rst             = 0;
    #2      rst             = 1;
            enb             = 1;

            i_serialLeft    = 0;
            i_serialRight   = 0;
            i_parallel      = 4'b0111;
            selector        = 3;

    #10;
            selector        = 0;

    #4;
            selector        = 1;
    #4      i_serialLeft    = 0;
    #9      i_serialRight   = 1;
    #2      i_serialRight   = 0;
    #3      i_parallel      = 4'b0000;
    
    #12;
            
            selector        = 3;
            i_serialLeft    = 0;
            i_serialRight   = 0;
    #2      i_parallel      = 4'b1001;

    #10;
            selector        = 0;

    #4;
            selector        = 2;
    #7      i_serialRight   = 0;
    #2      i_serialLeft    = 1;
    #2      i_serialLeft    = 0;
    #2      i_parallel      = 4'b0000;
  

   
end

always begin
    #1 clk <= ~clk;
end

endmodule

