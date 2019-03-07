module shift #(
	parameter BITS  = 32
	parameter SHIFT  = $clog2(BITS)
	)(
	input       		clk,
	input       		rst,
	input       		enb,
	input	[SHIFT-1:0]	shift,
	input   [BITS-1:0]  inp,

	output  [BITS-1:0]  out
	);

	logic   [BITS-1:0] r_out;

	always_ff@(posedge clk, negedge rst)begin
		if (!rst)begin
			r_out <= '0;
		end
		else if (enb) begin
			r_out <= inp << shift;
		end
		else begin
			r_out <= r_out;
		end
	end

	assign out = r_out;

endmodule