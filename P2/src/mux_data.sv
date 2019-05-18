`ifndef MUX_DATA_SV
    `define MUX_DATA_SV

module mux_data
import pkg_system_mdr::*;
(
	input		data_in_t	i_mult,
	input		data_t		i_div,
	input		data_t		i_root,
	input		data_in_t	i_null,
	input		op_select_t	i_selector,
	
	output	data_in_t	o_dataM,
	output	data_t		o_dataDR
);

data_in_t	r_dataM;
data_t		r_dataDR;

always_comb begin
	case(i_selector)
		MULT: begin
			r_dataM 		= i_mult;
			r_dataDR 	= '0;
		end
		DIV:	begin
			r_dataM 		= '0;
			r_dataDR 	= i_div;
		end
		ROOT:	begin
			r_dataM 		= '0;
			r_dataDR 	= i_root;
		end
		NON:	begin
			r_dataM 		= '0;
			r_dataDR 	= '0;
		end
		default:	begin
			r_dataM 		= '0;
			r_dataDR 	= '0;
		end
	endcase
	
end

assign o_dataM 		=	r_dataM;
assign o_dataDR		=	r_dataDR;

endmodule
`endif

