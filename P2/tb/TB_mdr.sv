module tb_ms
	import pkg_system_mdr::*; ();

	logic       		clk = 0;
	logic       		rst;

	logic       		start;
	logic       		load;
	data_t 			data;
	op_select_t 		op;

	data_t  			remainder;
	data_t			result;
	logic				ready;
	logic       		load_x;
	logic       		load_y;
	logic       		error;


	mdr TB_simulation
	(
		.clk        	(clk),
		.rst        	(rst),

		.i_start    	(start),
		.i_load     	(load),
		.i_data     	(data),
		.i_op       	(op),

		.o_remainder 	(remainder),
		.o_result   	(result),
		.o_ready		(ready),
		.o_load_x   	(load_x),
		.o_load_y   	(load_y),
		.o_error    	(error)
	);

	always #1 clk	<=	~clk;

	initial begin
		op    	= 	MULT;
		load   	= 	1; 
		rst    	=	1;
		start  	= 	1;
	    	data   	= 	0;	#4;
       
	    	rst    	= 	0;	#10;
	    	rst    	= 	1;	#3;
		
	    	start  	= 	0;	#2;
	    	start  	= 	1;	#2;
 	    
	    	data   	= 	11;  	#4;
	    	load   	= 	0;   	#2;
	    	load   	= 	1;   	#2;
	    
	    	data   	= 	7; 	#4;
	    	load   	= 	0;  	#2;
	    	load   	= 	1;   	#(DW2*3);
				
		op    	= 	DIV;	#4;

	    	start  	= 	0;	#2;
	    	start  	= 	1;	#2;
 	    
    		data   	= 	15;  	#4;
    		load   	= 	0;   	#2;
    		load   	= 	1;   	#2;
	    
    		data   	= 	7; 	#4;
    		load   	= 	0;  	#2;
    		load   	= 	1;   #(DW2*3);

		op    	= 	ROOT;	#4;
		
	    	start  	= 	0;	#2;
	    	start  	= 	1;	#2;
 	    
	    	data   	= 	10;  	#4;
	    	load   	= 	0;   	#2;
	    	load   	= 	1;   	#2;
	    
	    	data   	= 	7; 	#4;
	    	load   	= 	0;  	#2;
	    	load   	= 	1;   	#(DW2*3);
		
	end

endmodule // tb_ms