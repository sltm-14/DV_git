`ifndef PROCESSOR_SV
    `define PROCESSOR_SV

module processor
import mxv_pkg::*;
(
	input clk,
	input rst,

	input           ena,
	input data_i_t  matriz,
	input data_i_t  vector,
	input result_t  last_result,

	output result_t result
);


always@(posedge clk, negedge rst)begin
	if(!rst)begin
		result = '0;
	end 
	else if (ena) begin
		result = last_result + (matriz * vector);
	end
end

endmodule
`endif