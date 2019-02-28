module ff_d (
input       clk,
input       rst,
input       enb,
input       inp,
output      out
);
logic ff_d_r;

always_ff@(posedge clk or negedge rst) begin: ff_d_label
    if(!rst)
        ff_d_r  <= '0;
    else if (enb)
        ff_d_r  <= inp;
end:ff_d_label

assign out  = ff_d_r;

endmodule
