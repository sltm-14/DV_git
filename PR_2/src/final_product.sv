`ifndef FINAL_PRODUCT_SV
    `define FINAL_PRODUCT_SV

module final_product
import pkg_system_mdr::*;
(
	input clk,
	input rst, 
	input i_flag,
	input signed [32:0] i_data,
	
	output o_ready,
	output signed [31:0] o_data
);

logic signed [31:0] r_data;
logic r_ready;
always_ff@(posedge clk, negedge rst) begin
	if(~rst) begin
		r_data <= '0;
		r_ready <= '0;
	end
	else if(~i_flag) begin
		r_data <= r_data;
		r_ready <= '0;
	end
	else begin
		r_data <= i_data[DW-1:1];
		r_ready <= 1'b1;
	end
end

assign o_data 	= r_data;
assign o_ready = r_ready;

endmodule
`endif
 