module control#(
	parameter BW = 8,
	parameter DW = $clog2(BW)
	)(
	input 	i_clk,
	input 	i_rst,
	input 	i_start,
	input 	i_lsb,

	output 	o_load,
	output 	o_add,
	output 	o_shift,
	output 	o_stop
	);

	enum logic [2:0] {IDLE, INIT, ADD_SHIFT} state; 

	logic 	r_load;
	logic 	r_add;
	logic 	r_shift;
	logic 	r_stop;

	logic [DW:0]  r_count = '0;

	always_ff@(posedge i_clk, posedge i_rst)begin

		if(!i_rst)
			state <= IDLE;
		else begin
		 
			case (state)
				IDLE:  begin
					if(i_start == 1'b1)
						state <= INIT;
					else 
						state <= IDLE;
				end

				INIT:  begin
					state <= ADD_SHIFT;
				end
						
				ADD_SHIFT: begin
					if (BW == r_count)
						state <= IDLE;
					else
						state <= ADD_SHIFT;
				end
							 
				default:
					state <= IDLE;

			endcase 
		end
	 end

	 always@(posedge i_clk, posedge i_rst) begin
		if(!i_rst)begin
			r_load  = 1'b0;
			r_add   = 1'b0;
			r_shift = 1'b0;
			r_stop  = 1'b0;

			r_count = '0;
		end
		else begin
	 
			case (state)
				IDLE:  begin
				    r_load  = 1'b0;
					r_add   = 1'b0;
				 	r_shift = 1'b0;
					r_stop  = 1'b1;
					r_count = '0;
				end

				INIT:  begin
					r_load  = 1'b1;
					r_add   = 1'b0;
				 	r_shift = 1'b0;
					r_stop  = 1'b0;	
				end
						
				ADD_SHIFT: begin
					if (i_lsb)
						r_add   = 1'b1;
					else 
						r_add   = 1'b0;
					
					r_load  = 1'b0;
					r_stop  = 1'b0;
					r_shift = 1'b1;

					r_count = r_count + 1'b1;		
				end
							 
				default:begin
					r_load  = 1'b0;
					r_add   = 1'b0;
				 	r_shift = 1'b0;
					r_stop  = 1'b0;	
				end
			endcase // state	
		end
	 end
	 
	assign  o_load  = r_load;
	assign	o_add	= r_add;
	assign 	o_shift	= r_shift;
	assign	o_stop	= r_stop;

endmodule 
