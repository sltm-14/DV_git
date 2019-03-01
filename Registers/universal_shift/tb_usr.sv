
module tb_usr #(
    parameter DW  = 4
    )();

    logic           clk;
    logic           rst;
    logic           enb;
    logic [1:0]     selector;
    logic           i_serialLeft;
    logic           i_serialRight;
    logic [DW-1:0]  i_parallel;
    
    logic [DW-1:0] out;


usr USR(
    .clock(clk),
    .reset(rst),
    .enb(enb),
    .selector(selector),
    .i_serialLeft(i_serialLeft),
    .i_serialRight(i_serialRight),
    .i_parallel(i_parallel),
    
    .out(out)
);

initial begin
            rst     = 0;
            clk     = 0;
            enb     = 0;
            rst     = 1;
    #1      rst     = 0;
    #4      rst     = 1;
    #4      enb     = 1;

    #4      i_serialLeft  = 0;
    #4      i_serialRight = 0;
    #2      i_parallel    = 4'b0111;
    #4      selector      = 3;

    #10;



   
end

always begin
    #1 clk <= ~clk;
end

endmodule

