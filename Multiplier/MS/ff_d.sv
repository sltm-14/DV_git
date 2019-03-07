module ff_d #(
	parameter DW = 8 
	)(
	input       	i_clk,
	input       	i_rst,
	input			i_load,
	input  [DW-1:0]	i_data,

	output [DW-1:0]	o_out
	);

	logic [DW-1:0] r_ff;

	always_ff@(posedge i_clk or negedge i_rst) begin: ff_d
	    if(!i_rst)
	        r_ff  <= '0;
	    else if (i_load)
	        r_ff  <= i_data;
	end:ff_d

	assign o_out  = r_ff;

endmodule
