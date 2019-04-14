module tb_ms
	import pkg_system_mdr::*; ();

	logic       clk;
	logic       rst;

	logic       start;
	logic       load;
	data_in_t   data;
	op_select_t op;

/*	reminder_t  reminder;
	data_t      result;*/
	logic       load_x;
	logic       load_y;
	logic       error;


	mdr TB_simulation(
		.clk        (clk),
		.rst        (rst),

		.i_start    (start),
		.i_load     (load),
		.i_data     (data),
		.i_op       (op),

/*		.o_reminder (reminder),
		.o_result   (result),*/
		.o_load_x   (load_x),
		.o_load_y   (load_y),
		.o_error    (error)
	);

	always #1 clk <= ~clk;

	initial begin
		op     = ROOT;
		load   = 1; 
		rst    = 1;
		start  = 1;
	    data   = 0;   #4;
       
	    rst    = 0;   #10;
	    rst    = 1;   #3;
		
	    start  = 0;   #2;
	    start  = 1;   #2;
 	    
	    data   = 25;  #4;
	    load   = 0;   #2;
	    load   = 1;   #2;
	    
	    data   = 00;  #4;
	    load   = 0;   #2;
	    load   = 1;   #2;

	end

endmodule // tb_ms