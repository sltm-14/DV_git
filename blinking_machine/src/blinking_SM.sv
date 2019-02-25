module blinking_SM
(
	input        i_clk,
	input        i_rst,
	input        i_start,
	input 		 i_enable,

	output       o_out,
	output		 o_flag_counter,
	output [2:0] o_count_ena
	);

enum logic [2:0] {IDLE, ON_1, OFF_1, ON_2, OFF_2, ON_3, OFF_3} state; 

logic       l_out;
logic			l_flag_counter;
logic [2:0] l_count_ena;

 always_ff@(posedge i_clk, posedge i_rst)begin

		if(i_rst)
			state <= IDLE;
		else
	 
		case (state)
			IDLE:
				if(i_start == 1'b1)
					state <= ON_1;
				else
					state <= IDLE;

			ON_1:
				if(i_enable == 1'b0)
					state <= ON_1;
				else
					state <= OFF_1;
				
			OFF_1:
				if(i_enable == 1'b0)
					state <= OFF_1;
				else
					state <= ON_2;
			
			ON_2:
				if(i_enable == 1'b0)
					state <= ON_2;
				else
					state <= OFF_2;
				
			OFF_2:
				if(i_enable == 1'b0)
					state <= OFF_2;
				else
					state <= ON_3;
					
			ON_3:
				if(i_enable == 1'b0)
					state <= ON_3;
				else
					state <= OFF_3;
				
			OFF_3:
				if(i_enable == 1'b0)
					state <= OFF_3;
				else
					state <= IDLE;
			default:
					state = IDLE;

		endcase // state		 
 end

 always_comb begin
	if(state == ON_1 || state == ON_2 || state == ON_3)begin
		l_flag_counter = 1'b1;
		l_out       = 1'b1;
		l_count_ena = 3'b110;
	end
	else if(state == OFF_1 || state == OFF_2 || state == OFF_3)begin
		l_flag_counter = 1'b1;
		l_out       = 1'b0;
		l_count_ena = 3'b100;
	end
	else	begin
		l_flag_counter = 1'b0;
		l_out       = 1'b0;
		l_count_ena = 3'b000;
	end
 end
 
 assign o_flag_counter = l_flag_counter;
 assign o_out       = l_out;
 assign o_count_ena = l_count_ena;

endmodule // blinking_SM