`ifndef FINAL_VALUES_SV
    `define FINAL_VALUES_SV

module final_values
import pkg_system_mdr::*;
#(	
	parameter VW   = 32 )
 (
	input logic [VW-1:0]		i_reminder,
	input logic [VW-1:0]    i_quotient,
	input							i_done,

	output logic [VW-1:0]   o_reminder,
	output logic [VW-1:0]   o_quotient,
	output						o_ready
);

assign o_reminder	=	i_reminder[VW-1] ? i_reminder + ((i_quotient << 1) | 1) : i_reminder ;
assign o_quotient =	i_quotient;
assign o_ready		=	i_done;

endmodule
`endif