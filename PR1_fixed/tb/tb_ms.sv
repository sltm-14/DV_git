module tb_ms
	import pkg_mult::*;
	();
	bit 			TB_clk =0;
	bit 			TB_rst;
	bit 			TB_start;
	logic  [DW:0] TB_multd_val; //[DW-1:0]
	logic  [DW:0] TB_multr_val; //[DW-1:0]

	logic	[DW2:0]	TB_leds;
	logic 	 		TB_ready;

	logic			TB_o_clk;


	ms_sim TB_simulation(
	.i_clk(TB_clk),
	.i_rst(TB_rst),
	.i_start(TB_start),
	.i_sw({TB_multd_val,TB_multr_val}),

	.o_led(TB_leds),
	.o_ready(TB_ready)
	

	);

	always #1 TB_clk <= ~TB_clk;

	initial begin
		 TB_start  	 = 1;       #20;
	    TB_rst    	 = 0;       #20;
	    TB_rst   	 = 1;       #3;

	    TB_multd_val = -256; 	
	    TB_multr_val = -256; 	#8;
 
	    TB_start 	 = 0;       #2;
	    TB_start  	 = 1;       #20;


	    TB_multd_val = 7; 	
	    TB_multr_val = 7; 	#8;
 
	    TB_start 	 = 0;       #2;
	    TB_start  	 = 1;       #20;


	
	end



endmodule // tb_ms