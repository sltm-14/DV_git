module control
import control_pkg::*;
(
	input 	i_clk,			/* Clk */
	input 	i_rst,			/* Rst */
	input 	i_start,		/* Start */
	input   i_mltr_done,	/* Multiplier is done */

	output	o_show,
	output 	o_load,			/* Load */
	output 	o_ready,		/* Ready */
	output	o_clean			/* Clean */
);

control_t r_control;


always_ff@(posedge i_clk, negedge i_rst)begin: state_machine
	if(!i_rst)
		r_control.state <= IDLE;
	else begin
		case (r_control.state)
			IDLE:  /* Changes to INIT is start is press */
			begin
				if(i_start == 1'b1)
					r_control.state <= INIT;
				else 
					r_control.state <= IDLE;
			end

			INIT:  /* Changes to ADD_SHIFT */
			begin
				r_control.state <= ADD_SHIFT;
			end
					
			ADD_SHIFT: /* Stays here until multiplication is done */
			begin
				if ( ( (MAX_CNTR <= r_control.count) || (i_mltr_done == 1'b1) ) && r_control.count > '0)
					
					r_control.state <= IDLE;
				
				else
					r_control.state <= ADD_SHIFT;
			end
						 
			default:
				r_control.state <= IDLE;
				
		endcase 
	end
end: state_machine

always@(posedge i_clk, negedge i_rst) begin: outputs
	if(!i_rst)begin
		r_control.load 	<= 1'b0;
		r_control.ready <= 1'b0;
		r_control.clean <= 1'b1;

		r_control.count <= '0;
	end
	else begin
 
		case (r_control.state)
			IDLE:  begin /* Is ready to receive anew value */
				r_control.load   <= 1'b0;
				r_control.ready  <= 1'b1;
				r_control.clean  <= 1'b0;
				r_control.count  <= '0;
				o_show <= '0;
			end

			INIT:  begin /* Signat to load value */
				r_control.load   <= 1'b1;
				r_control.ready  <= 1'b0;
				r_control.clean  <= 1'b1;
				r_control.count  <= '0;	
			end
					
			ADD_SHIFT: begin /* Add 1 to counter */
				r_control.ready  <= 1'b0;
				r_control.load   <= 1'b0;
				r_control.clean  <= 1'b0;

				r_control.count  <= r_control.count + 1'b1;	
				
				if ( ( (MAX_CNTR <= r_control.count) || (i_mltr_done == 1'b1) ) && r_control.count > '0)
					o_show <= 1'b1;
				else
					o_show <= '0;
			end
		
			default:begin
				r_control.load   <= 1'b0;
				r_control.ready  <= 1'b0;
				r_control.clean  <= 1'b0;
				r_control.count  <= '0;	
			end
		endcase // state	
	end
end: outputs 
 
/* Assignatioin of outputs */
assign  o_load  = r_control.load;
assign	o_ready	= r_control.ready;
assign  o_clean = r_control.clean;

endmodule 