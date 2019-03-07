module counter
    import packege::*;
    (
    input                   clk,
    input                   rst,
    input                   enb,
    output          ovf_t   ovf,
    output          cnt_t   count
    );

    cntr_t cntr;

    always_ff@(posedge clk, negedge rst) begin: counter
        if (!rst)
            cntr.count    <=  '0;
        else if (enb)
            if (cntr.count >= MAXCNT-1'b1)
                cntr.count <= '0;
            else
                cntr.count <= cntr.count + 1'b1;
    end:counter

    always_comb begin: comparator
        if (cntr.count >= MAXCNT-1'b1)
            cntr.ovf     =   1'b1;    
        else
            cntr.ovf     =   1'b0;
    end:comparator

    assign count    =   cntr.count;
    assign ovf      =   cntr.ovf;

endmodule


