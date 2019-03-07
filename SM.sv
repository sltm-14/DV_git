module control(
	input        i_clk,
	input        i_rst,
	input        i_start,
	input 		 i_lsb,

	output       o_load,
	output		 o_add,
	output 		 o_shift,
	output		 o_stop
	);

	enum logic [2:0] {IDLE, INIT, CHECK, ADD, SHIFT} state; 



	always_ff@(posedge i_clk, posedge i_rst)begin

		if(!i_rst)
			state <= IDLE;
		else
		 
		case (state)
			IDLE:  begin

			end

			INIT:  begin
				
			end
					
			CHECK: begin
				
			end
				
			ADD:   begin
				
			end
					
			SHIFT: begin
				
			end
						 
			default:
				state = IDLE;

		endcase // state		 
	 end

	 always_comb begin
		if(!i_rst)
			state <= IDLE;
		else
	 
		case (state)
			IDLE: 

			INIT: 
					
			CHECK: 
				
			ADD:  
					
			SHIFT:  
						 
			default:
				state = IDLE;

		endcase // state	
	 end
	 

endmodule 
