module TB_blinking_machine();

	logic TB_clk;
	logic TB_rst;
	logic TB_start;

	logic TB_out;
	logic TB_clk_1hz;

	TOP_blinking_machine TOP(
		.i_clk(TB_clk),
		.i_rst(TB_rst),
		.i_start(TB_start),

		.o_out(TB_out),
		.o_clk_1hz(TB_clk_1hz)
		);

	always #5 TB_clk = ~TB_clk;

	initial begin
	         TB_rst   = 1;
	    #5   TB_rst   = 0;

	    #10  TB_start = 1;
	    #10  TB_start = 0;
	    #300 TB_start = 1;
	    #10  TB_start = 0;
	end

endmodule