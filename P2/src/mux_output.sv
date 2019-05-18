`ifndef MUX_OUTPUT_SV
    `define MUX_OUTPUT_SV

module mux_output
import pkg_system_mdr::*;
(
	input	data_t		i_result_mult,
	input data_t		i_result_div,
	input data_t		i_result_root,
	input	data_t		i_remainder_div,
	input	data_t 		i_remainder_root,
	input 				i_ready_mult,
	input					i_ready_div,
	input					i_ready_root,
	input op_select_t	i_selector,

	
	output data_t		o_result,
	output data_t		o_remainder,
	output				o_ready
);

data_t	r_result;
data_t	r_remainder;
logic		r_ready;

always_comb begin
	case(i_selector)
		MULT: begin
			r_result		=	i_result_mult;
			r_remainder	=	'0;			
			r_ready		=	i_ready_mult;

		end
		DIV:	begin
			r_result		=	i_result_div;
			r_remainder	=	i_remainder_div;			
			r_ready		=	i_ready_div;
		end
		ROOT:	begin
			r_result		=	i_result_root;
			r_remainder	=	i_remainder_root;			
			r_ready		=	i_ready_root;
		end
		NON:	begin
			r_result		=	'0;
			r_remainder	=	'0;			
			r_ready		=	'0;
		end
		default:	begin
			r_result		=	'0;
			r_remainder	=	'0;			
			r_ready		=	'0;
		end
	endcase
	
end

assign o_result 		=	r_result;
assign o_remainder	=	r_remainder;
assign o_ready			=	r_ready;

endmodule
`endif
