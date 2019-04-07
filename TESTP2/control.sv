`ifndef CONTROL_SV
    `define CONTROL_SV
module control
import system_mdr_pkg::*;
(
	input				clk,
	input 				rst,

	if_mdr.control		control_if
);

st_control r_control;

always_ff@(posedge clk, negedge rst)begin: state_machine
	if(!rst)			
		r_control.state <= IDLE;
	else begin
		case (r_control.state)
			IDLE: begin
				if(!control_if.w_start)
					r_control.state <= CLEAN;
				else 
					r_control.state <= IDLE;
			end

			CLEAN: begin
				r_control.state <= WAIT_Y;
			end

			WAIT_X: begin
				if(!control_if.w_load)
					r_control.state <= WAIT_Y;
				else
					r_control.state <= CLEAN;
			end

			WAIT_Y: begin
				if(!control_if.w_load)
					r_control.state <= VERIFICATION;
				else
					r_control.state <= CLEAN;
			end

			VERIFICATION: begin
				if(control_if.w_error)
					r_control.state <= IDLE;
				else
					r_control.state <= CALCULATION;
			end

			CALCULATION:  begin
				if ( r_control.ovf ) 
					r_control.state <= READY;
				else
					r_control.state <= CALCULATION;
			end
					
			READY:	begin
				r_control.state <= IDLE;
			end
						 
			default:
				r_control.state <= IDLE;
				
		endcase 
	end
end: state_machine


always@(r_control.state) begin: outputs
	if(!rst)begin
		r_control.loadX 	<= 1'b0;
		r_control.loadY 	<= 1'b0;
		r_control.clean 	<= 1'b0;
		r_control.veri 		<= 1'b0;
		r_control.error 	<= 1'b0;
		r_control.enable 	<= 1'b0;
		r_control.ready 	<= 1'b0;
	end
	else begin
 
		case (control_if.state)
			IDLE:  begin
				r_control.clean 	<= 1'b0; 	
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end

			CLEAN:  begin
				r_control.clean 	<= 1'b1; 		
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end
					
			WAIT_X: begin
				r_control.clean 	<= 1'b0; 
				r_control.loadX 	<= 1'b1;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end

			WAIT_Y: begin
				r_control.clean 	<= 1'b0; 
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b1;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end

			VERIFICATION: begin
				r_control.clean 	<= 1'b0; 
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b1;
				r_control.error 	<= control_if.w_error;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end

			CALCULATION: begin
				r_control.clean 	<= 1'b0; 
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b1;
				r_control.ready 	<= 1'b0;
			end
		
			READY: begin
				r_control.clean 	<= 1'b0; 
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b1;
			end

			default:begin
				r_control.clean 	<= 1'b0;					
				r_control.loadX 	<= 1'b0;
				r_control.loadY 	<= 1'b0;
				r_control.veri 		<= 1'b0;
				r_control.error 	<= 1'b0;
				r_control.enable 	<= 1'b0;
				r_control.ready 	<= 1'b0;
			end
		endcase 	
	end
end: outputs 

assign control_if.clean =	r_control.clean;					
assign control_if.loadX	=	r_control.loadX;
assign control_if.loadY	=	r_control.loadY;
assign control_if.veri	=	r_control.veri;
assign control_if.error	=	r_control.error;
assign control_if.enable=	r_control.enable;
assign control_if.ready	=	r_control.ready;


/* Counter */

always_ff@(posedge clk, negedge rst)begin: counter
    if (!rst)
        r_control.count     <=  '0;
    else if (r_control.enable)
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

assign control_if.ovf	=	r_control.ovf;

endmodule
`endif



	