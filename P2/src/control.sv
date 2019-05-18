`ifndef CONTROL_SV
    `define CONTROL_SV

module control
import pkg_system_mdr::*;
(
	input		clk,
	input 	rst,
	input		i_start,
	input   	i_load,
	input		i_error1,
	input		i_error2,
	input 	i_done,
	
	output  	o_clean,
	output	o_save_x,
	output	o_save_y,
	output	o_load_x,
	output	o_load_y,
	output  	o_veri,
	output	o_veri2,
	output	o_error,
	output	o_enable,
	output	o_ready,
	output  	o_init
);

st_control 	r_control;

always_ff@(posedge clk, negedge rst) begin: state_machine
	if(!rst)			
		r_control.state 				<= IDLE;
	else begin
	
		case (r_control.state)
			IDLE: begin
				if(~i_start)
					r_control.state 	<= CLEAN;
				else 
					r_control.state 	<= IDLE;
			end

			CLEAN: begin
				r_control.state 		<= WAIT_X;
			end

			WAIT_X: begin
				if(~i_load)
					r_control.state 	<= SAVE_X; 
				else
					r_control.state 	<= WAIT_X;
			end

			SAVE_X: begin
				r_control.state 		<= WAIT_Y;
			end

			WAIT_Y: begin
				if(~i_load)
					r_control.state 	<= SAVE_Y;
				else
					r_control.state 	<= WAIT_Y;
			end

			SAVE_Y: begin
				r_control.state 		<= VERIFICATION;
			end

			VERIFICATION: begin
				if(i_error1)
					r_control.state 	<= IDLE;
				else
					r_control.state 	<= INIT;
			end

			INIT: begin
				r_control.state 		<= CALCULATION;
			end

			CALCULATION:  begin
				if (i_done) 
					r_control.state 	<= VERIFICATION2;
				else
					r_control.state 	<= CALCULATION;
			end
					
			VERIFICATION2: begin
				if(i_error2)
					r_control.state 	<= IDLE;
				else
					r_control.state 	<= READY;
			end
			
			READY:	begin
				r_control.state 		<= IDLE;
			end
						 
			default:
				r_control.state 		<= IDLE;
				
		endcase 
	end
end: state_machine

always_comb begin: outputs

	case (r_control.state)
		IDLE:  begin
			r_control.clean 	= 1'b0; 	
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		CLEAN:  begin
			r_control.clean 	= 1'b1; 		
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end
				
		WAIT_X: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b1;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		SAVE_X: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b1;
			r_control.save_y 	= 1'b0;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		WAIT_Y: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b1;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		SAVE_Y: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b1;		
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		VERIFICATION: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b1;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= i_error1;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		INIT:begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b1;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		CALCULATION: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b1;
			r_control.ready 	= 1'b0;
		end
		
		VERIFICATION2: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b1;
			r_control.init 	= 1'b0;
			r_control.error 	= i_error2;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end

		READY: begin
			r_control.clean 	= 1'b0; 
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b1;
		end

		default:begin
			r_control.clean 	= 1'b0;					
			r_control.load_x 	= 1'b0;
			r_control.load_y 	= 1'b0;
			r_control.save_x 	= 1'b0;
			r_control.save_y 	= 1'b0;
			r_control.veri 	= 1'b0;
			r_control.veri2	= 1'b0;
			r_control.init 	= 1'b0;
			r_control.error 	= 1'b0;
			r_control.enable 	= 1'b0;
			r_control.ready 	= 1'b0;
		end
	endcase 	
end: outputs 

assign o_clean 		=	r_control.clean;					
assign o_load_x 		=	r_control.load_x;
assign o_load_y		=	r_control.load_y;
assign o_save_x 		=	r_control.save_x;
assign o_save_y		=	r_control.save_y;
assign o_veri 			=	r_control.veri;
assign o_veri2			=	r_control.veri2;
assign o_init 			=	r_control.init;
assign o_error		 	=	r_control.error;
assign o_enable 		=	r_control.enable;
assign o_ready 		=	r_control.ready;

endmodule
`endif



	