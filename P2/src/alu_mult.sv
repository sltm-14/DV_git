`ifndef ALU_MULT_SV
    `define ALU_MULT_SV

module alu_mult
import pkg_system_mdr::*;
(	
	input data_in_t		 	i_val_a_M,
	input data_in_t		 	i_val_b_M,
	input data_t		 		i_val_a_DR,
	input data_t		 		i_val_b_DR,
	
	input op_t      			i_sltr,
	input							i_init,
	input							i_enable,
	input							i_flag,
	input op_select_t			i_op,

	output data_in_t		   o_val_M,
	output data_t				o_val_DR,
	output						o_flag
);

data_in_t	r_val_M 	= '0;
data_t		r_val_DR	= '0;
logic 		r_flag;

always@(*) begin
	if(i_enable) begin
		if(i_sltr == ADD) begin
			if(i_op == MULT)
				r_val_M 	= (i_val_a_M  +  i_val_b_M);
			else if(i_op == ROOT)
				r_val_DR	= (i_val_a_DR  +  i_val_b_DR);
			r_flag 	= '0;
		end

		else if (i_sltr == SUBS) begin
				if(i_op == MULT) begin
					r_val_M 	= (i_val_a_M - i_val_b_M);
					r_val_DR	= '0;
					r_flag 	= '0;
				end
				else if(i_op == ROOT) begin
					r_val_M 	= '0;
					r_val_DR	= (i_val_a_DR  -  i_val_b_DR);
					r_flag 	= '0;
				end
				else if((i_op == DIV) & (i_flag)) begin
					r_val_DR = (i_val_a_DR - i_val_b_DR);
					r_val_M	= '0;
					r_flag 	= 1'b1;
				end
				else begin
					r_val_DR	= '0;
					r_val_M	= '0;
					r_flag 	= '0;
				end
		end
		else if (i_sltr == NULL) begin
			r_val_DR	= i_val_a_DR;
			r_val_M	= i_val_a_M;
			r_flag 	= '0;
		end
		else begin
			r_val_DR	= '0;
			r_val_M	= i_val_a_M;
			r_flag 	= '0;
		end
	end 
	else begin
		r_val_DR	= '0;
		r_val_M	= i_val_a_M;
		r_flag 	= '0;
	end
end

assign o_val_DR 	= 	r_val_DR;
assign o_val_M 	=	r_val_M;
assign o_flag 		= 	r_flag;

endmodule 
`endif