/*-----------------------------------------------
* MODULE: 	  control.sv
* DESCRITION: State machine with three states
					IDLE: In this state waits the start	
							signal 
					INIT: In this state the values are
							loaded into the registers
					ADD_SHIFT: In this state the values are 
									calculated and showed in the	
									FPGA board
* INPUTS: 	  clock, reset, start, multiplier done
* OUTPUTS:    Show data, load data, ready data, and 
					clean the data
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
module control
import pkg_mult::*;
(
	input 	i_clk,			/* Clk */
	input 	i_rst,			/* Rst */
	input 	i_start,			/* Start */

	output 	o_load,			/* Load */
	output	o_clean,			/* Clean */
	output  o_ready,
	output  o_ovf
);

control_t r_control;

always_ff@(posedge i_clk, negedge i_rst)begin: state_machine
	if(!i_rst)			/*Begins with the IDLE state*/
		r_control.state <= IDLE;
	else begin
		case (r_control.state)
			IDLE:  /* Changes to INIT is start is press */
			begin
				if(!i_start)
					r_control.state <= INIT;
				else 
					r_control.state <= IDLE;
			end

			INIT:  /* Changes to ADD_SHIFT where the values are loaded*/
			begin
				r_control.state <= ADD_SHIFT;
			end
					
			ADD_SHIFT: /* Stays here until multiplication is done */
			begin
				if ( (r_control.ovf) && (!r_control.load) ) 
					r_control.state <= IDLE;
				
				else
					r_control.state <= ADD_SHIFT;
			end
						 
			default:
				r_control.state <= IDLE;
				
		endcase 
	end
end: state_machine

always@(r_control.state) begin: outputs
	if(!i_rst)begin
		r_control.load 	<= 1'b0;
		r_control.clean <= 1'b1;
		r_control.enb 	<= 1'b0;
		r_control.ready <= 1'b0;
	end
	else begin
 
		case (r_control.state)
			IDLE:  begin 		/* Is ready to receive anew value */
				r_control.load   <= 1'b0;
				r_control.clean  <= 1'b0;
				r_control.enb    <= 1'b0;
				r_control.ready  <= 1'b1;
			end

			INIT:  begin 		/* Signat to load value */
				r_control.load   <= 1'b1;
				r_control.clean  <= 1'b1;
				r_control.enb    <= 1'b1;
				r_control.ready  <= 1'b0;
			end
					
			ADD_SHIFT: begin /* Add 1 to counter */
				r_control.load   <= 1'b0;
				r_control.clean  <= 1'b0;
				r_control.enb    <= 1'b1;
				r_control.ready  <= 1'b0;
			end
		
			default:begin
				r_control.load   <= 1'b0;
				r_control.clean  <= 1'b0;
				r_control.enb    <= 1'b0;
				r_control.ready  <= 1'b0;
			end
		endcase // state	
	end
end: outputs 

always_ff@(posedge i_clk, negedge i_rst)begin: counter
    if (!i_rst)
        r_control.count     <=  '0;
    else if (r_control.enb)
        r_control.count     <= r_control.count + 1'b1;
    else
    	r_control.count 	<=  '0;
end:counter

always_comb begin
    if (r_control.count > DW)
        r_control.ovf     =   1'b1;    
    else
        r_control.ovf     =   1'b0;
end


 
/* Assignatioin of outputs */
assign 		o_ready		= r_control.ready;
assign 		o_ovf		= r_control.ovf;
assign  	o_load  	= r_control.load;
assign  	o_clean 	= r_control.clean;

endmodule 