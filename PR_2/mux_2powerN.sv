`ifndef MUX_2POWERN_SV
    `define MUX_2POWERN_SV

module mux_2powerN 
import pkg_system_mdr::*;
#( parameter MDW = 16)
 (
	input   [MDW-1:0]    i_buses,    
	input   sltr_t      i_sltr,     

	output  [2**MUX_SEL-1:0][MDW-1:0]   o_bus      
);

assign o_bus = i_buses[i_sltr];

endmodule
`endif

