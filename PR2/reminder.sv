`ifndef REMINDER_SV
    `define REMINDER_SV

module reminder
import pkg_system_mdr::*;(
	input		clk,
	input 		rst, 

	if_mdr.reminder rem

	);

	st_reminder r_rem;

/* 	input w_alu_rem,
	input w_mux_rem,
	input w_ovf,
	input w_op,
	input w_enable,

	output w_rem_val,
	output w_rem_2lsb,
	output w_r_mb */

	always @ (posedge clk, negedge rst)begin
		if(!rst)begin
			r_rem.rem_val <= '0;
			rem.w_rem_val 	<= '0;
			rem.w_rem_2lsb  <= '0;
			rem.w_r_mb 		<= '0;
		end

		else if(rem.w_init)begin
			case (rem.w_op) 
				MULT: begin
					r_rem.rem_val[0] 	  <= 1'b0;
					r_rem.rem_val[DW:1] <= rem.w_mux_rem[DW-1:0];
					r_rem.rem_val[DW2-1:DW+1] <= '0;
				end

				DIV: begin
					r_rem.rem_val <= {'0,rem.w_mux_rem};
				end

				ROOT: begin
					r_rem.rem_val <= rem.w_mux_rem;
				end

				default: begin
					r_rem.rem_val <= rem.w_mux_rem;
				end
			endcase // op
			
		end

		else if(rem.w_enable)begin
			case (rem.w_op) 
				MULT: begin
					r_rem.rem_val[DW-1:0]   <= r_rem.rem_val[DW-1:1] ;
					r_rem.rem_val[DW2-2:DW] <= rem.w_alu_rem[DW-1:0];
					if(rem.w_alu_rem[DW2-1] == 0)
						r_rem.rem_val[DW2-1]	<= 1'b0;
					else 
						r_rem.rem_val[DW2-1]	<= 1'b1;
				end

				DIV: begin
					r_rem.rem_val <= rem.w_alu_rem;
					r_rem.rem_val <= r_rem.rem_val<<1;
					if(r_rem.rem_val[DW-1])
						r_rem.rem_val[0] <= 1'b0;
					else
						r_rem.rem_val[0] <= 1'b1;
				end

				ROOT: begin
					r_rem.rem_val <= rem.w_alu_rem;
					r_rem.rem_val <= r_rem.rem_val << 2;
					if ( r_rem.rem_val[DW-1]  && rem.w_ovf)
						r_rem.rem_val <= r_rem.rem_val >> 2;
					else
						r_rem.rem_val <= r_rem.rem_val;

				end

				default: begin
					rem.w_rem_val 	<= '0;
					rem.w_rem_2lsb  <= '0;
					rem.w_r_mb 		<= '0;
				end
			endcase // op
		end
		else begin
			rem.w_rem_val 	<= '0;
			rem.w_rem_2lsb  <= '0;
			rem.w_r_mb 		<= '0;
		end

		rem.w_rem_val   <= r_rem.rem_val;
		rem.w_rem_2lsb  <= r_rem.rem_val[1:0];
		rem.w_r_mb 		<= r_rem.rem_val[DW-1];

	end

endmodule
`endif