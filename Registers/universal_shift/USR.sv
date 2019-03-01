module USR#(
	PARAMETER DW  = 4
)
(
	input clock,
	input reset,
	input [1:0] selector,
	input i_serialLeft,
	input i_serialRight,
	input [DW-1:0] i_parallel,
	
	output [DW-1:0] out
)

//	logic [DW-1:0] dataParallel;
//	logic serialLeft;
//	logic serialRight;
	
	wire [DW + 1'b1:0] w_data;
	wire [DW - 1'b1:0] w_mux_ff;
	
	assign w_data[0] = i_serialRight;
	assign w_data[DW+1]  = i_serialLeft;
	
	generate 
		for (genvar i = 1; i <= DW ; i = i + 1'b1)begin: generate_USR
			multiplexer MUX(
				.clk(clock),
				.rst(reset),
				.i_slc(selector),
				.i_data({i_parallel[i]},w_data[i-1'b1],w_data[i+1'b1],w_data[i]),

				.o_out(w_mux_ff[i])
			);
			
			
			);
			
			ff_d flipflop(
				.clk(clk        ),
				.rst(rst        ),
				.enb(enb        ),
				.inp(w_mux_ff[i]),
				.out(w_data[i]  )
			);
		end: generate_USR
	endgenerate
	
