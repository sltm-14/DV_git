`ifndef COUNTER2_SV
    `define COUNTER2_SV
    
module counter2
import pkg_system_mdr::*;
(
    input           clk,
    input           rst,

    input           i_enable,

    output logic [7:0]  o_counter,
    output logic   		o_ovf
);

logic [7:0] r_count;

always_ff@(posedge clk, negedge rst)begin
    if (!rst)
        r_count     <=  '0;
    else if (i_enable) begin
			if(r_count >= 16 - 1'b1)
				r_count <= '0;
			else
				r_count <= r_count + 1'b1;
	 end
end

always_comb begin
    if (r_count >= 16 - 1'b1)
        o_ovf     =   1'b1;    
    else
        o_ovf     =   1'b0;
end


assign o_counter = r_count; 

endmodule
`endif