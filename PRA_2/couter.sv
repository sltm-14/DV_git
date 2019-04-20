`ifndef COUNTER_SV
    `define COUNTER_SV
    
module counter
import pkg_system_mdr::*;
#(  parameter LIMIT = 16,
    parameter LB = $clog2(LIMIT) )
 (
    input           clk,
    input           rst,

    input           i_enable,

    output logic [LB-1:0]  o_counter,
    output logic   o_ovf
);

logic [LB-1:0] r_count;

always_ff@(posedge clk, negedge rst)begin
    if (!rst)
        r_count     <=  LIMIT-1;
    else if (i_enable)
        r_count     <= r_count - 1'b1;
    else
    	r_count 	<=  LIMIT-1;
end

always_comb begin
    if (r_count <= '0)
        o_ovf     =   1'b1;    
    else
        o_ovf     =   1'b0;
end


assign o_counter = r_count; 

endmodule
`endif