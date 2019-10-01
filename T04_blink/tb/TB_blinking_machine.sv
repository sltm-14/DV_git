


module TB_blinking_machine;

	bit TB_clk;
	bit TB_rst;
	bit TB_start;

	wire TB_out;
	wire TB_clk_1hz;

	always #5 TB_clk <= ~TB_clk;

	initial begin
	    TB_rst   = 1;    #100;
	    TB_rst   = 0;    #500;

	    TB_start = 1;    #100;
	    TB_start = 0;    #1000;

	    TB_start = 1;    #100;
	    TB_start = 0;    #3000;

	    TB_start = 1;    #100;
	    TB_start = 0;    #1000;

	end
	
		TOP_blinking_machine TOP(
		.i_clk(TB_clk),
		.i_rst(TB_rst),
		.i_start(TB_start),

		.o_out(TB_out),
		.o_clk_1hz(TB_clk_1hz)
		);

endmodule
