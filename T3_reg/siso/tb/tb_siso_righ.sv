
module tb_siso_right;

logic           clk;
logic           rst;
logic           enb;
logic           inp;
logic           out;


siso_right uut(
.clk    (clk    ),
.rst    (rst    ),
.enb    (enb    ),
.inp    (inp    ),
.out    (out    )
);

initial begin
            rst     = 0;
            clk     = 0;
            enb     = 0;
            inp     = 0;
            rst     = 1;
    #10.2   rst     = 0;
    #4.2    rst     = 1;
    #5      enb     = 1;
    #5      inp     = 1;
    #5      inp     = 0;
    #5      inp     = 1;
    #3      inp     = 0;
    #6      inp     = 1;
    #6      inp     = 0;
    #6      inp     = 1;
    #6      inp     = 0;
    #100
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule
