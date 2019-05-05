`ifndef COMPARATOR_SV
    `define COMPARATOR_SV
    
module comparator
import pkg_system_mdr::*;
(	
	input 				clk,
	input 				rst, 
	input data_sign_t	i_result,
	
	output 				o_done
);

logic r_done;

always_ff@(posedge clk, negedge rst) begin
	if(~rst)
		r_done <= '0;
	else if(i_result == 16'b1)
		r_done <= 1'b1;
	else
		r_done <= '0;
end

assign o_done = r_done;

endmodule 
`endif